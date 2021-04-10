package org.fridge;

import org.fridge.mapper.MenuFavouriteMapper;
import org.fridge.model.MenuFavourite;
import org.fridge.service.MenuFavouriteService;
import org.fridge.service.MenuService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
public class MenuFavouriteTest {
    MenuFavouriteMapper menuFavouriteMapper;
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

    @Autowired
    public void setMenuFavouriteMapper(MenuFavouriteMapper menuFavouriteMapper) {
        this.menuFavouriteMapper = menuFavouriteMapper;
    }
    @Test
    public void getList() {

        List<MenuFavourite> menuFavourite1 = menuFavouriteService.selectFavourite(1L);
        List<MenuFavourite> menuFavourites = menuFavouriteMapper.selectMenuFavouriteByUserId(1L);
        for (MenuFavourite favourite : menuFavourite1) {
            System.out.println(favourite);
        }
    }
}
