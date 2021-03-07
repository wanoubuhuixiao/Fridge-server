package org.fridge.mapper;

import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface menuFoodMapper {
    /**
     * 用食材id获得相关的菜谱id
     */
    @Select(value = {"select menu_id from menu_food where food_id=#{foodid}"})
    List<Integer> selectMenuByFood(Integer foodid);
}
