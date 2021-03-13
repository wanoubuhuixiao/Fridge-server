package org.fridge.service;

import org.fridge.mapper.MenuFavouriteMapper;
import org.fridge.mapper.MenuMapper;
import org.fridge.model.Menu;
import org.fridge.model.MenuFavourite;
import org.fridge.model.common.ApiResponse;
import org.fridge.model.common.Responses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuService {
    MenuMapper menuMapper;
    MenuFavouriteMapper menuFavouriteMapper;

    @Autowired
    public void setMenuMapper(MenuMapper menuMapper) {
        this.menuMapper = menuMapper;
    }

    @Autowired
    public void setMenuFavouriteMapper(MenuFavouriteMapper menuFavouriteMapper) {
        this.menuFavouriteMapper = menuFavouriteMapper;
    }

    public ApiResponse<Menu> selectNullTagItem() {
        return Responses.ok(menuMapper.selectNullTagItem());
    }

    public ApiResponse<Object> updateTag(String tag, long id) {
        int result = menuMapper.updateTag(tag, id);
        if (result == 1) {
            return Responses.ok();
        } else {
            return Responses.fail();
        }
    }

    public List<MenuFavourite> selectFavourite(int userId) {
        return (menuFavouriteMapper.selectMenuFavouriteByUserId(userId));
    }

    public List<Menu> MenuQueryByName(String menu) {
        return menuMapper.selectMenuByName(menu);
    }

    public List<Menu> selectLimitMenu(int num){
        return menuMapper.selectLimitMenu(num);
    }
}
