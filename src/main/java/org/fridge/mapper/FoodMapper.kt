package org.fridge.mapper

import org.apache.ibatis.annotations.Mapper
import org.apache.ibatis.annotations.Select
import org.fridge.model.Food
import org.springframework.stereotype.Repository

@Mapper
@Repository
interface FoodMapper {
    @Select("select * from food")
    fun list(): List<Food>

    @Select("select * from food where fridgeId = #{id} order by adddate(productionDate, shelfLife) limit 4")
    fun firstFourDeadlineFood(id: Long): List<Food>

    @Select("select * from food where fridgeId = #{id} order by productionDate desc limit 4")
    fun firstFourRecentFood(id: Long): List<Food>
}