package org.fridge.controller;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.fridge.model.Menu;
import org.fridge.model.RawMenu;
import org.fridge.model.common.ApiResponse;
import org.fridge.model.common.Responses;
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

    @JsonIgnoreProperties(value = {"handler"})
    @PostMapping(value = "/menu/recommend")
    public ApiResponse<Object> menuRecommend(Long fridgeId, int num) {
        if (num < 0) {
            return Responses.fail();
        }
        List<Menu> menuList = menuService.menuRecommend(fridgeId, num);
        return Responses.ok(menuList);
    }

    @PostMapping(value = "/menu/select/id")
    public Menu getMenuById(int id) {
        return menuService.selectMenuById(id);
    }

}
