package com.algaworks.algafood.api.controller.openapi;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.model.CidadeModel;
import com.algaworks.algafood.api.model.input.CidadeInput;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import java.util.List;

@Api(tags = "Cidades")
public interface CidadeControllerOpenApi {

    @ApiOperation("Lista as cidades")
    public List<CidadeModel> listar();

    @ApiOperation("Busca uma cidade por ID")
    @ApiResponses({
            @ApiResponse(responseCode  = "400", description  = "ID da cidade inválido", content  =@Content(mediaType = "application/json", schema = @Schema(implementation = Problem.class))),
            @ApiResponse(responseCode  = "404", description  = "Cidade não encontrada", content  =@Content(mediaType = "application/json", schema = @Schema(implementation = Problem.class)))
    })

    public CidadeModel buscar(@ApiParam("ID de uma cidade") Long cidadeId);

    @ApiOperation("Adiciona uma cidade")
    public CidadeModel adicionar(
            @ApiParam(name = "corpo", value = "Representação de uma nova cidade")
            CidadeInput cidadeInput);

    @ApiOperation("Atualiza uma cidade por ID")
    @ApiResponses({
            @ApiResponse(responseCode  = "200", description  = "Cidade atualizada"),
            @ApiResponse(responseCode  = "404", description  = "Cidade não encontrada", content  =@Content(mediaType = "application/json", schema = @Schema(implementation = Problem.class)))
    })

    public CidadeModel atualizar(
            @ApiParam("ID de uma cidade")
            Long cidadeId,
            @ApiParam(name = "corpo", value = "Representação de uma nova cidade com os novos dados")
            CidadeInput cidadeInput);

    @ApiOperation("Excluir uma cidade por ID")
    @ApiResponses({
            @ApiResponse(responseCode  = "204", description  = "Cidade excluída", content  =@Content(mediaType = "application/json", schema = @Schema())),
            @ApiResponse(responseCode  = "404", description  = "Cidade não encontrada", content  =@Content(mediaType = "application/json", schema = @Schema(implementation = Problem.class)))
    })
    public void remover(
            @ApiParam("ID de uma cidade")
            Long cidadeId);
}
