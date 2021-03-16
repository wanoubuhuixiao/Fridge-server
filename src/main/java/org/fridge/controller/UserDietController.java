package org.fridge.controller;

import org.fridge.model.Diet;
import org.fridge.model.UserDiet;
import org.fridge.model.common.ApiResponse;
import org.fridge.model.common.Responses;
import org.fridge.service.UserDietService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class UserDietController {
    UserDietService userDietService;

    @Autowired
    public void setUserDietService(UserDietService userDietService) {
        this.userDietService = userDietService;
    }

    /**
     * 根据用户已输入的名称推荐搜索词
     *
     * @param name 用户已输入的名称
     */
    @PostMapping(value = "/diet/select/name")
    public ApiResponse<List<Diet>> selectDietFuzzy(String name) {
        List<Diet> list = userDietService.selectDietFuzzy(name);
        return Responses.ok(list);
    }

    /**
     * 用户添加不吃的食物或tag(对于前端来说这两种是一样的）
     */
    @PostMapping(value = "/diet/insert")
    public ApiResponse<Object> insertDiet(Integer userId, String id) {
        if (userId == null || id == null) {
            return Responses.fail();
        }
        if (userDietService.insertUserDiet(userId, id) == 1) {
            return Responses.ok();
        }
        return Responses.fail();
    }

    /**
     * 用户删除不吃的食物或tag
     */
    @PostMapping(value = "/diet/delete")
    public ApiResponse<Object> deleteDiet(Integer userId, String id) {
        if (userId == null || id == null) {
            return Responses.fail();
        }
        if (userDietService.deleteUserDiet(userId, id) == 1) {
            return Responses.ok();
        }
        return Responses.fail();
    }

    /**
     * 查询用户不吃的食物或tag
     */
    @PostMapping(value = "/diet/select")
    public ApiResponse<Object> selectDiet(Integer userId) {
        if (userId == null) {
            return Responses.fail();
        }
        List<UserDiet> list = userDietService.selectAllDietByUserID(userId);
        return Responses.ok(list);
    }
}
