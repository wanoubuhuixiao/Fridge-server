package org.fridge;

import org.fridge.service.MessageService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class MessageTest {
    MessageService messageService;

    @Autowired
    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    @Test
    void testPut() {
        messageService.addMessage("message", "你好");
        System.out.println(messageService.getMessage("message"));
        System.out.println(messageService.getMessage("message"));

    }
}
