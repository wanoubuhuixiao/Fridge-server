package org.fridge.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.fridge.model.Diet;
import org.fridge.model.FoodWarehouse;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface FoodWarehouseMapper {
    @Select(value = "select * from food_warehouse where foodName=#{foodname}")
    FoodWarehouse selectFoodByName(String foodname);

    /**
     * 用食物名称获得食物id
     */
    @Select(value = {"select id from food_warehouse where foodName=#{foodname}"})
    Integer selectFoodIdByName(String foodname);

    /**
     * 模糊匹配食物名称
     * @param foodName 输入的（部分）食物名称
     * @return 能模糊匹配到的Diet
     */
    @Select(value = {"select cast(id as char) as id, foodName as name from food_warehouse where foodName like concat('%', #{foodName}, '%') limit 10"})
    List<Diet> selectDietFuzzy(String foodName);


}
