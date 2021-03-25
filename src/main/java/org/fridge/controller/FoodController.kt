package org.fridge.controller

import org.fridge.mapper.FoodMapper
import org.fridge.model.Food
import org.fridge.model.common.ApiResponse
import org.fridge.model.common.Responses
import org.fridge.service.FoodService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.ResponseBody
import java.text.SimpleDateFormat
import java.util.*

@Controller
class FoodController {
    @Autowired
    lateinit var foodMapper: FoodMapper

    @Autowired
    lateinit var foodService: FoodService

    @PostMapping(path = ["/foods/deadline"])
    @ResponseBody
    fun firstFourDeadlineFood(id: Long) = Responses.ok(foodMapper.firstFourDeadlineFood(id))

    @PostMapping(path = ["/foods/recent"])
    @ResponseBody
    fun firstFourRecentFood(id: Long) = Responses.ok(foodMapper.firstFourRecentFood(id))

    @PostMapping(value = ["/foods/insert"])
    @ResponseBody
    fun insertFood(
            foodName: String,
            productionDate: String,
            freezer: Long,
            level: Long,
            defrost: Long,
            fridgeId: Long,
            weight: Float,
    ): ApiResponse<Any> {
        val food = Food()
        food.foodName = foodName
        val sdf = SimpleDateFormat("yyyy-MM-dd HH:mm")
        sdf.timeZone = TimeZone.getTimeZone("GMT+8:00")
        food.productionDate = sdf.parse(productionDate)
        food.freezer = freezer
        food.level = level
        food.defrost = defrost
        food.fridgeId = fridgeId
        food.weight = weight

        val result = foodService.insertFood(food)
        if (result == 1) {
            return Responses.ok()
        }
        if (result == -1) {
            return Responses.fail("食物仓库里没有这种食物")
        }
        return Responses.fail("食物录入失败")
    }

    @PostMapping(value = ["/foods/delete"])
    @ResponseBody
    fun takeFood(foodName: String, fridgeId: Int): ApiResponse<Any> {
        val result = foodService.takeFood(foodName, fridgeId)
        if (result == 1) {
            return Responses.ok()
        }
        return Responses.fail()
    }

}

