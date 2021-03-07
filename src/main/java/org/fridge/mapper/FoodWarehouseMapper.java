package org.fridge.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.fridge.model.FoodWarehouse;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface FoodWarehouseMapper {
    @Select(value="select * from food_warehouse where foodName=#{foodname}")
    FoodWarehouse selectFoodByName(String foodname);

    /**
     * 用食物名称获得食物id
     */
    @Select(value = {"select id from food_warehouse where foodName=#{foodname}"})
    Integer selectFoodIdByName(String foodname);


}
