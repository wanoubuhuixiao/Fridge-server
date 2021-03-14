package org.fridge;

import org.fridge.mapper.MenuFavouriteMapper;
import org.fridge.model.MenuFavourite;
import org.fridge.service.MenuService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class MenuFavouriteTest {
    MenuFavouriteMapper menuFavouriteMapper;
    MenuService menuService;

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }

    @Autowired
    public void setMenuFavouriteMapper(MenuFavouriteMapper menuFavouriteMapper) {
        this.menuFavouriteMapper = menuFavouriteMapper;
    }

    @Test
    public void getList() {
        List<MenuFavourite> menuFavourites = menuFavouriteMapper.selectMenuFavouriteByUserId(1);

        for (MenuFavourite favourite : menuFavourites) {
            System.out.println(favourite);
        }
    }
}
