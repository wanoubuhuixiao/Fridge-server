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

import java.util.Date;

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
    void BMI() {
        double a = 1;
        if (a == 1) {
            System.out.println("a等于1");
        }
        a++;
        if (a == 2) {
            System.out.println("a=2");
        }
        a++;
        if (a == 3) {
            System.out.println("a=3");
        }
        a = 0.1 + 0.2;
        if (a == 0.3) {
            System.out.println("a=0.3");
        }


    }
}
