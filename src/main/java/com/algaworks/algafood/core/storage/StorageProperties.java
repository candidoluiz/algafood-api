package com.algaworks.algafood.core.storage;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.nio.file.Path;

@Getter
@Setter
@Component
@ConfigurationProperties("algafood.storage")
public class StorageProperties {

    private Local local = new Local();

    @Getter
    @Setter
    public class Local{
        private Path diretorioFotos;
    }
}
