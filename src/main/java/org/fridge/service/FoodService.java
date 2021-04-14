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
    FoodWarehouseMapper foodWarehouseMapper;

    @Autowired
    public void setFoodMapper(FoodMapper foodMapper) {
        this.foodMapper = foodMapper;
    }

    @Autowired
    public void setFoodWarehouseMapper(FoodWarehouseMapper foodWarehouseMapper) {
        this.foodWarehouseMapper = foodWarehouseMapper;
    }

    public int insertFood(Food food) {
        FoodWarehouse fo = foodWarehouseMapper.selectFoodByName(food.getFoodName());
        if (fo != null) {
            food.setId(fo.getId());
            long freezer = food.getFreezer();
            if (freezer == 1){
                if(fo.getFreezerShelfLife()!=null){
                    food.setShelfLife(fo.getFreezerShelfLife());
                }

            }
            else{
                if(fo.getRefrigeratorShelfLife()!=null){
                    food.setShelfLife(fo.getRefrigeratorShelfLife());
                }

            }
            return foodMapper.insertFood(food);
        }
        return -1;//仓库里没有这种食材，即fo==null
    }

    public int takeFood(String foodName, Integer fridgeId) {
        return foodMapper.deleteFood(foodName, fridgeId);
    }

    public String findFoodLevel(String foodName, Integer fridgeId) {
        String result;
        Integer level = foodMapper.findFoodLevel(foodName, fridgeId);
        Integer freeze = foodMapper.findFoodFreezer(foodName, fridgeId);
        if (level != null) {
            String res = freeze==1?"冷藏":"冷冻";
//            if (freeze == 1)
            result = foodName + "在冰箱的"+res+"区"+"的第" + level + "层";
        } else {
            result = "冰箱里没有" + foodName;
        }
        return result;
    }

}
