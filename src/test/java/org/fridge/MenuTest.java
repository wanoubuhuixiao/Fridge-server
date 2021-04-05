package org.fridge;

import org.fridge.controller.MenuController;
import org.fridge.mapper.FoodMapper;
import org.fridge.mapper.MenuMapper;
import org.fridge.model.Food;
import org.fridge.service.MenuService;
import org.fridge.service.SpeakService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

@SpringBootTest
public class MenuTest {
    MenuMapper menuMapper;

    FoodMapper foodMapper;

    MenuController menuController;

    MenuService menuService;

    SpeakService speakService;

    @Autowired
    public void setSpeakService(SpeakService speakService) {
        this.speakService = speakService;
    }

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }

    @Autowired
    public void setMenuController(MenuController menuController) {
        this.menuController = menuController;
    }

    @Autowired
    public void setFoodMapper(FoodMapper foodMapper) {
        this.foodMapper = foodMapper;
    }

    @Test
    public void insertFood() {
        Food food = new Food();
        food.setId(34);
        food.setDefrost(78);
        food.setFreezer(22);
        food.setFridgeId(1);
        food.setLevel(1);
        food.setProductionDate(new Date());
        food.setShelfLife(23);
        foodMapper.insertFood(food);
    }

    @Autowired
    public void setMenuMapper(MenuMapper menuMapper) {
        this.menuMapper = menuMapper;
    }

    @Test
    void selectTagIdByName() {
        String str = "番茄炒鸡蛋怎么做";
        System.out.println(str.substring(0, 5));
    }

    @Test
    void getMenu() {
        speakService.ruyiRobot("杭州天气", "xxx");
    }

    @Test
    void BMI() throws ParseException {
//        Date date = new Date();
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//        System.out.println("时间是" + formatter.format(date));

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        System.out.println("时间是" + sdf.parse("2021-4-5 12:09"));
        sdf.setTimeZone(TimeZone.getTimeZone("GMT+8:00"));
        System.out.println("时间是" + sdf.parse("2021-4-5 12:09"));


    }
}
