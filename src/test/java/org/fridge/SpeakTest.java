package org.fridge;

import com.google.gson.Gson;
import org.fridge.service.SpeakService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.UUID;

@SpringBootTest
public class SpeakTest {
    SpeakService speakService;

    @Autowired
    public void setSpeakService(SpeakService speakService) {
        this.speakService = speakService;
    }
    @Test
    void testSpeak(){
        System.out.println(speakService.speak("你好", UUID.randomUUID().toString()));

    }
}
