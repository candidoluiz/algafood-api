package com.algaworks.algafood.domain.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity
public class Pedido {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private BigDecimal subtotal;

    @Column(nullable = false)
    private BigDecimal taxaFrete;

    @Column(nullable = false)
    private BigDecimal valorTotal;

    @JsonIgnore
    @CreationTimestamp
    @Column(nullable = false, columnDefinition = "timestamp(0)")
    private LocalDateTime dataCriacao;

    @JsonIgnore
    @CreationTimestamp
    @Column(columnDefinition = "timestamp(0)")
    private LocalDateTime dataConfirmacao;

    @JsonIgnore
    @CreationTimestamp
    @Column(columnDefinition = "timestamp(0)")
    private LocalDateTime dataCancelamento;

    @JsonIgnore
    @CreationTimestamp
    @Column(columnDefinition = "timestamp(0)")
    private LocalDateTime dataEntrega;

    @ManyToOne
    @JoinColumn(nullable = false)
    private FormaPagamento formaPagamento;

    @ManyToOne
    @JoinColumn(nullable = false)
    private Restaurante restaurante;

    @ManyToOne
    @JoinColumn(name = "usuario_cliente_id", nullable = false)
    private Usuario cliente;

    @JsonIgnore
    @Embedded
    private Endereco enderecoEntrega;


    private StatusPedido statusPedido;

    @OneToMany(mappedBy = "pedido")
    private List<ItemPedido> itens = new ArrayList<>();
}
