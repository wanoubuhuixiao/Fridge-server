package org.fridge.controller;

import org.fridge.model.common.ApiResponse;
import org.fridge.service.SpeakService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SpeakController {
    SpeakService speakService;

    @Autowired
    public void setSpeakService(SpeakService speakService) {
        this.speakService = speakService;
    }

    @PostMapping(value = "/speak")
    public ApiResponse<Object> ChatRobot(String input, String uid) {
        return speakService.speak(input, uid);
    }
}
