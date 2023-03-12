package com.algaworks.algafood.infrastructure.service.email;

import com.algaworks.algafood.core.email.EmailProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Slf4j
public class SandboxEnvioEmailService extends SmptEnvioEmailService  {

    @Autowired
    private EmailProperties emailProperties;


    @Override
    protected MimeMessage criarMimeMessage(Mensagem mensagem) throws MessagingException {
       MimeMessage mimeMessage = super.criarMimeMessage(mensagem);

        MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "UTF-8");
        helper.setTo(emailProperties.getSandbox().getDestinatario());
        return mimeMessage;
    }
}
