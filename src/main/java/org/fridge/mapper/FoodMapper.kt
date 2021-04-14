package org.fridge.mapper

import org.apache.ibatis.annotations.Delete
import org.apache.ibatis.annotations.Insert
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

    @Insert("insert into food(id, foodName, productionDate, shelfLife, freezer, level, defrost, fridgeId, weight)\nvalues (#{id}, #{foodName}, #{productionDate}, #{shelfLife}, #{freezer}, #{level}, #{defrost}, #{fridgeId}, #{weight})")
    fun insertFood(food: Food): Int

    @Delete("delete from food where foodName=#{foodName} and fridgeId=#{fridgeId}")
    fun deleteFood(foodName: String, fridgeId: Int): Int

    @Select("select level from food where foodName=#{foodName} and fridgeId=#{fridgeId}")
    fun findFoodLevel(foodName: String, fridgeId: Int): Int?
    @Select("select freezer from food where foodName=#{foodName} and fridgeId=#{fridgeId}")
    fun findFoodFreezer(foodName: String, fridgeId: Int): Int?
    @Select("select * from food where fridgeId = #{id}")
    fun selectByFridgeId(id: Long): List<Food>
    @Select("select * from food where fridgeId = #{id} and foodName = #{name}")
    fun selectByFridgeIdAndFoodName(id: Long,name: String): List<Food>

}