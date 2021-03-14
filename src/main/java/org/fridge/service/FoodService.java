package org.fridge.service;

import org.fridge.mapper.FoodMapper;
import org.fridge.mapper.FoodWarehouseMapper;
import org.fridge.model.Food;
import org.fridge.model.FoodWarehouse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FoodService {
    FoodMapper foodMapper;

    @Autowired
    public void setFoodMapper(FoodMapper foodMapper) {
        this.foodMapper = foodMapper;
    }

    FoodWarehouseMapper foodWarehouseMapper;

    @Autowired
    public void setFoodWarehouseMapper(FoodWarehouseMapper foodWarehouseMapper) {
        this.foodWarehouseMapper = foodWarehouseMapper;
    }

    public int insertFood(Food food) {
        FoodWarehouse fo = foodWarehouseMapper.selectFoodByName(food.getFoodName());
        if (fo != null) {
            food.setId(fo.getId());
            long freezer = food.getFreezer();
            if (freezer == 1)
                food.setShelfLife(fo.getFreezerShelfLife());
            else
                food.setShelfLife(fo.getRefrigeratorShelfLife());

            return foodMapper.insertFood(food);
        }
        return 404;//仓库里没有这种食材，即fo==null
    }

    public int takeFood(String foodName){
        return foodMapper.deleteFood(foodName);
    }
}
