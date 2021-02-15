package org.fridge.controller

import org.fridge.model.common.ApiResponse
import org.fridge.model.common.Responses
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.ResponseBody
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@Controller
class TestController {
    @GetMapping(path = ["/hello"])
    @ResponseBody
    fun login(id: String?, password: String?, request: HttpServletRequest, res: HttpServletResponse): ApiResponse<Any> {
        return Responses.ok("hello")
    }
}

