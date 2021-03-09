package org.fridge;

import org.fridge.mapper.FoodMapper;
import org.fridge.mapper.MenuMapper;
import org.fridge.model.Food;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
        String productionDate="2010-03-08 20:20";
        try{
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Date date = sdf.parse(productionDate);
            System.out.println("日期为："+date);
        }catch (ParseException e){
            e.printStackTrace();
        }

    }
}
