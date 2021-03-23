package org.fridge.controller;

import org.fridge.model.Menu;
import org.fridge.model.common.ApiResponse;
import org.fridge.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class MenuController {
    MenuService menuService;

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }

    @PostMapping(value = "/menu/update/tag")
    public ApiResponse<Object> updateTag(String tag, long id) {
        return menuService.updateTag(tag, id);
    }

    @PostMapping(value = "/menu/select/nulltag")
    public ApiResponse<Menu> selectNullTag() {
        return menuService.selectNullTagItem();
    }

    @PostMapping(value = "/menu/select/name")
    public List<Menu> menuQueryByName(String menu) {
        return menuService.MenuQueryByName(menu);
    }

    @PostMapping(value = "/menu/recommend")
    public List<Menu> menuRecommend(int num) {
        if (num < 0) {
            return null;
        }
        return menuService.selectLimitMenu(num);
    }

    @PostMapping(value = "/menu/select/id")
    public Menu getMenuById(int id) {
        return menuService.selectMenuById(id);
    }

}
