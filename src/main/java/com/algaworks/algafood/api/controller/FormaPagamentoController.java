package com.algaworks.algafood.api.controller;

import com.algaworks.algafood.api.assembler.FormaPagamentoInputDisassembler;
import com.algaworks.algafood.api.assembler.FormaPagamentoModelAssembler;
import com.algaworks.algafood.api.model.FormaPagamentoModel;
import com.algaworks.algafood.api.model.input.FormaPagamentoInput;
import com.algaworks.algafood.core.security.CheckSecurity;
import com.algaworks.algafood.domain.model.FormaPagamento;
import com.algaworks.algafood.domain.repository.FormaPagamentoRepository;
import com.algaworks.algafood.domain.service.CadastroFormaPagamentoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.filter.ShallowEtagHeaderFilter;

import javax.validation.Valid;
import java.time.OffsetDateTime;
import java.util.List;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/formas-pagamento")
public class FormaPagamentoController {

    @Autowired
    private FormaPagamentoRepository formaPagamentoRepository;

    @Autowired
    private CadastroFormaPagamentoService cadastroFormaPagamento;

    @Autowired
    private FormaPagamentoModelAssembler formaPagamentoModelAssembler;

    @Autowired
    private FormaPagamentoInputDisassembler formaPagamentoInputDisassembler;

    @CheckSecurity.FormasPagamento.PodeConsultar
    @GetMapping
    public ResponseEntity<List<FormaPagamentoModel>> listar(ServletWebRequest request){
        ShallowEtagHeaderFilter.disableContentCaching(request.getRequest());

        String eTag = "0";

        OffsetDateTime dataUltimaAtualizacao = formaPagamentoRepository.getDataUltimaAtualizacao();

        if (dataUltimaAtualizacao != null){
            eTag = String.valueOf(dataUltimaAtualizacao.toEpochSecond());
        }

        if (request.checkNotModified(eTag)){
            return null;
        }

        List<FormaPagamento> todosFormaPagamentos = formaPagamentoRepository.findAll();

        List<FormaPagamentoModel> formasPagamentoModel= formaPagamentoModelAssembler.toCollectionModel(todosFormaPagamentos);
        return ResponseEntity.ok()
                .cacheControl(CacheControl.maxAge(10, TimeUnit.SECONDS).cachePublic())
                .eTag(eTag)
                .body(formasPagamentoModel);
    }

    @GetMapping("/{formaPagamentoId}")
    public ResponseEntity<FormaPagamentoModel>  buscar(@PathVariable Long formaPagamentoId, ServletWebRequest request){
        ShallowEtagHeaderFilter.disableContentCaching(request.getRequest());

        String eTag = "0";

        OffsetDateTime dataAtualizacao = formaPagamentoRepository.getDataAtualizacaoById(formaPagamentoId);

        if (dataAtualizacao != null) {
            eTag = String.valueOf(dataAtualizacao.toEpochSecond());
        }

        if (request.checkNotModified(eTag)) {
            return null;
        }

        FormaPagamento formaPagamento = cadastroFormaPagamento.buscarOuFalhar(formaPagamentoId);

        FormaPagamentoModel  formaPagamentoModel = formaPagamentoModelAssembler.toModel(formaPagamento);
        return ResponseEntity.ok()
                .cacheControl(CacheControl.maxAge(10, TimeUnit.SECONDS))
                .eTag(eTag)
                .body(formaPagamentoModel);
    }

    @CheckSecurity.FormasPagamento.PodeEditar
    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public FormaPagamentoModel  adicionar(@RequestBody @Valid FormaPagamentoInput formaPagamentoInput){
        FormaPagamento formaPagamento = formaPagamentoInputDisassembler.toDomainObject(formaPagamentoInput);
        formaPagamento = cadastroFormaPagamento.salvar(formaPagamento);

        return formaPagamentoModelAssembler.toModel(formaPagamento);
    }

    @CheckSecurity.FormasPagamento.PodeEditar
    @PutMapping("/{formaPagamentoId}")
    public FormaPagamentoModel atualizar(@PathVariable Long formaPagamentoId, @RequestBody @Valid FormaPagamentoInput formaPagamentoInput){

        FormaPagamento formaPagamentoAtual = cadastroFormaPagamento.buscarOuFalhar(formaPagamentoId);
        formaPagamentoInputDisassembler.copyToDomainObject(formaPagamentoInput, formaPagamentoAtual);
        formaPagamentoAtual = cadastroFormaPagamento.salvar(formaPagamentoAtual);
        return formaPagamentoModelAssembler.toModel(formaPagamentoAtual);
    }

    @CheckSecurity.FormasPagamento.PodeEditar
    @DeleteMapping("/{formaPagamentoId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void remover(@PathVariable Long formaPagamentoId){
        cadastroFormaPagamento.excluir(formaPagamentoId);
    }
}
