package org.fridge.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.ResponseBody
import java.util.*

@Controller
class IotController {
    @ResponseBody
    @PostMapping(value = ["/iot/t_and_h"])
    fun temperatureAndHumidity(temperature: Float, humidity: Float): Pair<Date, String> {
        return Date() to "$temperature, $humidity"
    }
}