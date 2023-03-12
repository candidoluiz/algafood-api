package com.algaworks.algafood.infrastructure.service.query;

import com.algaworks.algafood.domain.filter.VendaDiariaFilter;
import com.algaworks.algafood.domain.model.Pedido;
import com.algaworks.algafood.domain.model.StatusPedido;
import com.algaworks.algafood.domain.model.dto.VendaDiaria;
import com.algaworks.algafood.domain.service.VendaQueryService;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.Predicate;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
public class VendaQueryServiceImpl implements VendaQueryService {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<VendaDiaria> consultaVendasDiarias(VendaDiariaFilter filtro, String timeOffSet) {
       var builder = manager.getCriteriaBuilder();
       var query = builder.createQuery(VendaDiaria.class);
       var root = query.from(Pedido.class);

        var predicates = new ArrayList<Predicate>();

        var functionConvertDataCriacao = builder.function("timezone", Date.class, builder.literal(timeOffSet), root.get("dataCriacao")).as(Date.class);

       var functionDateDataCriacao = builder.function("to_char",String.class, functionConvertDataCriacao, builder.literal("yyyy-MM-dd")).as(String.class);

       var selection = builder.construct(VendaDiaria.class,
               functionDateDataCriacao,
               builder.count(root.get("id")),
               builder.sum(root.get("valorTotal")));

//        query.multiselect(functionDateDataCriacao.alias("data"),
//                builder.count(root.get("id")),
//                builder.sum(root.get("valorTotal")));

       if (filtro.getRestauranteId() != null){
           predicates.add(builder.equal(root.get("restaurante"), filtro.getRestauranteId()));
       }

       if (filtro.getDataCriacaoInicio() != null){
           predicates.add(builder.greaterThanOrEqualTo(root.get("dataCriacao"), filtro.getDataCriacaoInicio()));
       }
       if (filtro.getDataCriacaoFim() != null){
           predicates.add(builder.lessThanOrEqualTo(root.get("dataCriacao"), filtro.getDataCriacaoFim()));
       }

       predicates.add(root.get("status").in(StatusPedido.CONFIRMADO, StatusPedido.ENTREGUE));

       query.select(selection);
       query.where(predicates.toArray(new Predicate[0]));
       query.groupBy(functionDateDataCriacao);

       return manager.createQuery(query).getResultList();
    }
}
