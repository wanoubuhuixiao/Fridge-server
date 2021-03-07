package org.fridge.service;

import org.fridge.mapper.FoodMapper;
import org.fridge.model.Food;
import org.fridge.model.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FoodService {
    FoodMapper foodMapper;

    @Autowired
    public void setFoodMapper(FoodMapper foodMapper) {
        this.foodMapper = foodMapper;
    }

    public int insertFood(Food food){

        return foodMapper.insertFood(food);
    }
}
