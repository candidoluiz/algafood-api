package com.algaworks.algafood.api.model.input;

import lombok.Getter;
import lombok.Setter;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;

@Setter
@Getter
public class ItemPedidoInput {

    @NotNull
    private Long produtoId;

    @PositiveOrZero
    @NotNull
    private Integer quantidade;

    private String observacao;
}
