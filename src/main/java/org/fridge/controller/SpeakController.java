package org.fridge.controller;

import net.sf.json.JSONObject;
import org.fridge.model.common.ApiResponse;
import org.fridge.model.common.Responses;
import org.fridge.service.FoodService;
import org.fridge.service.MenuService;
import org.fridge.service.SpeakService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SpeakController {
    SpeakService speakService;

    MenuService menuService;

    FoodService foodService;

    @Autowired
    public void setFoodService(FoodService foodService) {
        this.foodService = foodService;
    }

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }

    @Autowired
    public void setSpeakService(SpeakService speakService) {
        this.speakService = speakService;
    }

    @PostMapping(value = "/speak")
    public ApiResponse<Object> speak(String input, String uid, Integer fridgeId) {
        int index1 = input.indexOf("怎么做");
        int index2 = input.indexOf("我想做");
        int index3 = input.indexOf("我想吃");

        int index4 = input.indexOf("在哪里");
        int index5 = input.indexOf("放在哪里");

        String service;
        JSONObject resultJson = new JSONObject();

        if (index4 != -1) {
            String foodName;
            service = "level";

            if (index5 != -1) {
                foodName = input.substring(0, index5);
            } else {
                foodName = input.substring(0, index4);
            }
            String text = foodService.findFoodLevel(foodName, fridgeId);
            resultJson.put("service", service);
            resultJson.put("result", text);
            return Responses.ok(resultJson);
        }


        if (index1 != -1 || index2 != -1 || index3 != -1) {
            String menuName;
            if (index1 != -1) {//怎么做
                menuName = input.substring(0, index1);
            } else if (index2 != -1) {//我想做
                menuName = input.substring(index2 + 3);
            } else {//我想吃
                menuName = input.substring(index3 + 3);
            }
            return menuService.SpeakMenuQuery(menuName);
        }

        if (input.contains("热量")) {
            return speakService.ruyiRobot(input, uid);
        }
        //其他用图灵机器人
        return speakService.tulingRobot(input);
    }
}
