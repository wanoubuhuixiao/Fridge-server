package org.fridge.mapper

import org.apache.ibatis.annotations.Mapper
import org.apache.ibatis.annotations.Select
import org.fridge.model.Food
import org.springframework.stereotype.Repository
import java.util.*

@Mapper
@Repository
interface FoodMapper {
    @Select("select * from food")
    fun list(): List<Food>
}