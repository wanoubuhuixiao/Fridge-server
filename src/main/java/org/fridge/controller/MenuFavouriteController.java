package org.fridge.controller;

import org.fridge.model.MenuFavourite;
import org.fridge.model.common.ApiResponse;
import org.fridge.model.common.Responses;
import org.fridge.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@ResponseBody
public class MenuFavouriteController {
    MenuService menuService;
    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }
    @PostMapping(value = "/menu/select/favourite")
    @ResponseBody
    public ApiResponse<List<MenuFavourite>> selectFavouriteByUserId(int id){
        return Responses.ok(menuService.selectFavourite(id));
    }
}
