package com.algaworks.algafood.api.controller;


import com.algaworks.algafood.api.assembler.CidadeInputDisassembler;
import com.algaworks.algafood.api.assembler.CidadeModelAssembler;
import com.algaworks.algafood.api.controller.openapi.CidadeControllerOpenApi;
import com.algaworks.algafood.api.model.CidadeModel;
import com.algaworks.algafood.api.model.input.CidadeInput;
import com.algaworks.algafood.core.security.CheckSecurity;
import com.algaworks.algafood.domain.exception.EstadoNaoEncontradoException;
import com.algaworks.algafood.domain.exception.NegocioException;
import com.algaworks.algafood.domain.model.Cidade;
import com.algaworks.algafood.domain.repository.CidadeRepository;
import com.algaworks.algafood.domain.service.CadastroCidadeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/cidades")
public class CidadeController implements CidadeControllerOpenApi {

    @Autowired
    private CidadeRepository cidadeRepository;

    @Autowired
    private CadastroCidadeService cadastroCidade;

    @Autowired
    private CidadeModelAssembler cidadeModelAssembler;

    @Autowired
    private CidadeInputDisassembler cidadeInputDisassembler;

    @CheckSecurity.Cidades.PodeConsultar
    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<CidadeModel> listar(){
        List<Cidade> todasCidades = cidadeRepository.findAll();

        return cidadeModelAssembler.toCollectionModel(todasCidades);
    }

    @CheckSecurity.Cidades.PodeConsultar
    @GetMapping("/{cidadeId}")
    public CidadeModel buscar(@PathVariable Long cidadeId){
        Cidade cidade = cadastroCidade.buscarOuFalhar(cidadeId);

        return cidadeModelAssembler.toModel(cidade);
    }

    @CheckSecurity.Cidades.PodeEditar
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public CidadeModel adicionar(@RequestBody @Valid CidadeInput cidadeInput){
        try {
            Cidade cidade = cidadeInputDisassembler.toDomainObject(cidadeInput);
            cidade = cadastroCidade.salvar(cidade);

            return cidadeModelAssembler.toModel(cidade);
        }catch (EstadoNaoEncontradoException e){
            throw new NegocioException(e.getMessage(), e);
        }
    }

    @CheckSecurity.Cidades.PodeEditar
    @PutMapping("/{cidadeId}")
    public CidadeModel atualizar(@PathVariable Long cidadeId, @RequestBody @Valid CidadeInput cidadeInput){
        try {
            Cidade cidadeAtual = cadastroCidade.buscarOuFalhar(cidadeId);

           cidadeInputDisassembler.copyToDomainObject(cidadeInput, cidadeAtual);
           cidadeAtual = cadastroCidade.salvar(cidadeAtual);

           return  cidadeModelAssembler.toModel(cidadeAtual);
        }catch (EstadoNaoEncontradoException e){
            throw new NegocioException(e.getMessage(), e);
        }
    }

    @CheckSecurity.Cidades.PodeEditar
    @DeleteMapping("/{cidadeId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void remover(@PathVariable Long cidadeId){
        cadastroCidade.excluir(cidadeId);
    }

}
