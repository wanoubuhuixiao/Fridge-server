package org.fridge.service;

import org.fridge.mapper.MenuFavouriteMapper;
import org.fridge.model.MenuFavourite;
import org.fridge.model.RawMenuFavourite;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuFavouriteService {
    MenuFavouriteMapper menuFavouriteMapper;

    @Autowired
    public void setMenuFavouriteMapper(MenuFavouriteMapper menuFavouriteMapper) {
        this.menuFavouriteMapper = menuFavouriteMapper;
    }

    public List<MenuFavourite> selectFavourite(Long userId) {
        System.out.println(menuFavouriteMapper.selectMenuFavouriteByUserId(userId));
        return (menuFavouriteMapper.selectMenuFavouriteByUserId(userId));
    }

    public int insertFavourite(RawMenuFavourite rawMenuFavourite) {
        if (rawMenuFavourite == null) {
            return -1;
        }
        return menuFavouriteMapper.insertMenuFavourite(rawMenuFavourite);
    }

    public int deleteFavourite(Integer menuId, Integer userId) {
        return menuFavouriteMapper.deleteMenuFavourite(menuId, userId);
    }
}
