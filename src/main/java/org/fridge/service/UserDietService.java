package org.fridge.service;

import org.fridge.mapper.FoodWarehouseMapper;
import org.fridge.mapper.TagDietMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserDietService {
    FoodWarehouseMapper foodWarehouseMapper;
    TagDietMapper tagDietMapper;
    UserDietService userDietService;

    @Autowired
    public void setUserDietService(UserDietService userDietService) {
        this.userDietService = userDietService;
    }

    @Autowired
    public void setFoodWarehouseMapper(FoodWarehouseMapper foodWarehouseMapper) {
        this.foodWarehouseMapper = foodWarehouseMapper;
    }

    @Autowired
    public void setTagDietMapper(TagDietMapper tagDietMapper) {
        this.tagDietMapper = tagDietMapper;
    }

    /**
     *
     * @param name 食物名称或tag描述
     * @return id 食物id或tagid；如果返回null表示找不到（不可选）这种“不吃的食物”
     */
    String findTagOrFood(String name){
        String id;
        //要先找tag，tag找不到才找foodWarehouse
        id=tagDietMapper.selectTagDiet(name);
        if(id == null){
            id = Integer.toString(foodWarehouseMapper.selectFoodIdByName(name));
            return id;
        }
        return  id;
    }
}
