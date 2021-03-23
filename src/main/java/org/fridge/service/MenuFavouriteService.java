package org.fridge.service;

import org.fridge.mapper.MenuFavouriteMapper;
import org.fridge.model.MenuFavourite;
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

    public List<MenuFavourite> selectFavourite(int userId) {
        return (menuFavouriteMapper.selectMenuFavouriteByUserId(userId));
    }
}
