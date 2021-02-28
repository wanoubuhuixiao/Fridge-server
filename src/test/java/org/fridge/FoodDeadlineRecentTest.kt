package org.fridge

import org.fridge.mapper.FoodMapper
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest

@SpringBootTest
class FoodDeadlineRecentTest {

    @Autowired
    lateinit var foodMapper: FoodMapper

    @Test
    fun firstFourDeadlineFood() {
        val foods = foodMapper.firstFourDeadlineFood(1)
        println(foods)
    }
}