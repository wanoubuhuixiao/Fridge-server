package org.fridge.controller

import org.fridge.mapper.FoodMapper
import org.fridge.model.common.ApiResponse
import org.fridge.model.common.Responses
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.ResponseBody

@Controller
class TestController {
    @Autowired
    lateinit var foodMapper: FoodMapper

    @GetMapping(path = ["/hello"])
    @ResponseBody
    fun hello(): ApiResponse<Any> {
        return Responses.ok("hello")
    }

    @GetMapping(path = ["/foods"])
    @ResponseBody
    fun listFoods() = Responses.ok(foodMapper.list())
}

