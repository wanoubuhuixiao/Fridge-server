package org.fridge;

import org.fridge.mapper.FoodMapper;
import org.fridge.mapper.MenuMapper;
import org.fridge.model.Food;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;

@SpringBootTest
public class MenuTest {
    MenuMapper menuMapper;

    FoodMapper foodMapper;

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
        System.out.println(menuMapper.selectMenuById(14));
    }
}
