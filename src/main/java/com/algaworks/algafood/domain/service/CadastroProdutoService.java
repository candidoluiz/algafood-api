package com.algaworks.algafood.domain.service;

import com.algaworks.algafood.domain.exception.EntidadeEmUsoException;
import com.algaworks.algafood.domain.exception.ProdutoNaoEncontradoException;
import com.algaworks.algafood.domain.model.Produto;
import com.algaworks.algafood.domain.repository.ProdutoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CadastroProdutoService {

    public static final String MSG_PRODUTO_EM_USO = "Produto de código %d não pode ser removido, pois está em uso";

    @Autowired
    private ProdutoRepository produtoRepository;

    @Transactional
    public Produto salvar(Produto produto){
        return produtoRepository.save(produto);
    }


    public Produto buscarOuFalhar(Long restauranteId, Long produtoId){
        return produtoRepository.findById(restauranteId,produtoId)
                .orElseThrow(()-> new ProdutoNaoEncontradoException(produtoId, restauranteId));
    }
}
