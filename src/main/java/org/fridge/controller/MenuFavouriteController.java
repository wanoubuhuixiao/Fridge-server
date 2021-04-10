package org.fridge.controller;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.fridge.model.MenuFavourite;
import org.fridge.model.RawMenuFavourite;
import org.fridge.model.common.ApiResponse;
import org.fridge.model.common.Responses;
import org.fridge.service.MenuFavouriteService;
import org.fridge.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@ResponseBody
public class MenuFavouriteController {
    MenuService menuService;
    MenuFavouriteService menuFavouriteService;

    @Autowired
    public void setMenuFavouriteService(MenuFavouriteService menuFavouriteService) {
        this.menuFavouriteService = menuFavouriteService;
    }

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }
    @JsonIgnoreProperties(value = {"handler"})
    @PostMapping(value = "/menu/select/favourite")
    @ResponseBody
    public ApiResponse<Object> selectFavouriteByUserId(Long id) {
        return Responses.ok(menuFavouriteService.selectFavourite(id));
    }

    /**
     * 添加收藏
     */

    @PostMapping(value = "/menu/insert/favourite")
    @ResponseBody
    public ApiResponse<Object> insertFavourite(Integer menuId, Integer userId) {
        if (menuId == null || userId == null) {
            return Responses.fail("菜谱id和用户id均不能为空");
        }
        Date date = new Date();
        RawMenuFavourite rawMenuFavourite = new RawMenuFavourite(menuId, date, userId);
        try {
            int result = menuFavouriteService.insertFavourite(rawMenuFavourite);
            if (result == 1) {
                return Responses.ok();
            } else {
                return Responses.fail();
            }
        } catch (DuplicateKeyException e) {
            e.printStackTrace();
            return Responses.fail("您已经收藏过此菜谱");
        } catch (DataIntegrityViolationException e) {
            e.printStackTrace();
            return Responses.fail("数据完整性约束异常");
        }
    }

    /**
     * 取消收藏
     */
    @PostMapping(value = "/menu/delete/favourite")
    @ResponseBody
    public ApiResponse<Object> deleteFavourite(Integer menuId, Integer userId) {
        int result = menuFavouriteService.deleteFavourite(menuId, userId);
        if (result == 1) {
            return Responses.ok();
        }
        return Responses.fail("取消收藏失败");
    }
}
