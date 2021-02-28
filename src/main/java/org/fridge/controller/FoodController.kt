package org.fridge.controller

import org.fridge.mapper.FoodMapper
import org.fridge.model.common.ApiResponse
import org.fridge.model.common.Responses
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.ResponseBody

@Controller
class FoodController {
    @Autowired
    lateinit var foodMapper: FoodMapper

    @RequestMapping(path = ["/foods/deadline"])
    @ResponseBody
    fun firstFourDeadlineFood(id: Long) = Responses.ok(foodMapper.firstFourDeadlineFood(id))

    @RequestMapping(path = ["/foods/recent"])
    @ResponseBody
    fun firstFourRecentFood(id: Long) = Responses.ok(foodMapper.firstFourRecentFood(id))

}

