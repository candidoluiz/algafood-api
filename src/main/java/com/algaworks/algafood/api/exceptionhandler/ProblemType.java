package com.algaworks.algafood.api.exceptionhandler;

import lombok.Getter;

@Getter
public enum ProblemType {

    PARAMETRO_INVALIDO("/parametro_invalido","Parametro inválido"),
    MENSAGEM_INCOMPREENSIVEL("/mensagem_incompreensivel","Mensagem incompreensível"),
    ENTIDADE_NAO_ENCONTRADA("/entidade-nao-encontrada", "Entidade não encontrada"),
    ERRO_NEGOCIO("/erro-negocio", "Violação de regra de negócio"),
    ENTIDADE_EM_USO("/entidade-em-uso", "Entidade em uso");

    private String title;
    private String uri;

    ProblemType(String path, String title){
        this.uri = "https://algafood.com.br" + path;
        this.title = title;
    }
}
