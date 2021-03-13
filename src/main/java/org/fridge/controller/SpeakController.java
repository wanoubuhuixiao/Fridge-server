package org.fridge.controller;

import com.alibaba.fastjson.JSONObject;
import org.fridge.model.Menu;
import org.fridge.model.common.ApiResponse;
import org.fridge.service.MenuService;
import org.fridge.service.SpeakService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SpeakController {
    SpeakService speakService;

    MenuService menuService;

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }

    @Autowired
    public void setSpeakService(SpeakService speakService) {
        this.speakService = speakService;
    }

    @PostMapping(value = "/speak")
    public ApiResponse<Object> speak(String input, String uid) {
        int index1 = input.indexOf("怎么做");
        int index2 = input.indexOf("我想做");
        int index3 = input.indexOf("我想吃");
        String menuName;
        if(index1 != -1 || index2 != -1 || index3 != -1){
            if(index1 != -1){//怎么做
                menuName = input.substring(0,index1);
            }
            else if(index2 != -1){//我想做
                menuName = input.substring(index2+3);
            }
            else {//我想吃
                menuName = input.substring(index3+3);
            }
            return menuService.SpeakMenuQuery(menuName);
        }

        if(input.contains("热量"))
        {
            return speakService.ruyiRobot(input, uid);
        }
        //其他用图灵机器人
        return speakService.tulingRobot(input);
    }
}
