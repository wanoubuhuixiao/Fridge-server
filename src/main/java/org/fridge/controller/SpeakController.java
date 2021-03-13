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
    public ApiResponse<Object> speak(String input, String uid) {
//        if(input.contains("天气") || input.contains("气温") || input.contains("温度") || input.contains("度") ){
//
//        }
        //还有别的东西可能不调用这个机器人
        return speakService.ruyiRobot(input, uid);
    }
}
