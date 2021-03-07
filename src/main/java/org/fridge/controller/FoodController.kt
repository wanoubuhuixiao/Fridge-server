package org.fridge.controller

import org.fridge.mapper.FoodMapper
import org.fridge.model.Food
import org.fridge.model.common.ApiResponse
import org.fridge.model.common.Responses
import org.fridge.service.FoodService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.ResponseBody
import java.util.*

@Controller
class FoodController {
    @Autowired
    lateinit var foodMapper: FoodMapper

    @Autowired
    lateinit var foodService: FoodService

    @RequestMapping(path = ["/foods/deadline"])
    @ResponseBody
    fun firstFourDeadlineFood(id: Long) = Responses.ok(foodMapper.firstFourDeadlineFood(id))

    @RequestMapping(path = ["/foods/recent"])
    @ResponseBody
    fun firstFourRecentFood(id: Long) = Responses.ok(foodMapper.firstFourRecentFood(id))

    @PostMapping(value = ["/food/insert"])
    fun foodInsert(foodName: String, productionDate: Date, freezer: Long, level: Long, defrost: Long, fridgeId: Long, weight: Float): ApiResponse<Any> {
        var food = Food()
        food.foodName=foodName
        food.productionDate=productionDate
        food.freezer=freezer
        food.level=level
        food.defrost=defrost
        food.fridgeId=fridgeId
        food.weight=weight
        
        if (foodService.insertFood(food) == 1) {
            return Responses.ok()
        }
        return Responses.fail()
    }

}

