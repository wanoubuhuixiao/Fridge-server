package org.fridge.service;

import net.sf.json.JSONObject;
import org.fridge.mapper.*;
import org.fridge.model.*;
import org.fridge.model.common.ApiResponse;
import org.fridge.model.common.Responses;
import org.fridge.util.PointCalculater;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class MenuService {
    MenuMapper menuMapper;
    UserInfoMapper userInfoMapper;
    MenuFavouriteMapper menuFavouriteMapper;
    FoodMapper foodMapper;
    UserDietMapper userDietMapper;

    @Autowired
    public void setUserDietMapper(UserDietMapper userDietMapper) {
        this.userDietMapper = userDietMapper;
    }

    @Autowired
    public void setFoodMapper(FoodMapper foodMapper) {
        this.foodMapper = foodMapper;
    }

    @Autowired
    public void setMenuFavouriteMapper(MenuFavouriteMapper menuFavouriteMapper) {
        this.menuFavouriteMapper = menuFavouriteMapper;
    }

    @Autowired
    public void setUserInfoMapper(UserInfoMapper userInfoMapper) {
        this.userInfoMapper = userInfoMapper;
    }

    @Autowired
    public void setMenuMapper(MenuMapper menuMapper) {
        this.menuMapper = menuMapper;
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

    public List<Menu> MenuQueryByName(String menu) {
        return menuMapper.selectMenuByName(menu);
    }

    public List<Menu> selectLimitMenu(int num) {
        return menuMapper.selectLimitMenu(num);
    }

    public Menu selectMenuById(int id) {
        return menuMapper.selectMenuById(id);
    }

    public ApiResponse<Object> SpeakMenuQuery(String menu) {
        String service = "menu";
        JSONObject resultJson = new JSONObject();

        List<Menu> menuList = MenuQueryByName(menu);
        resultJson.put("service", service);
        if (menuList.isEmpty()) {
            return Responses.fail("目前菜谱里没有这种菜，我会努力学习的！");
        }
        resultJson.put("result", menuList.get(0));
        return Responses.ok(resultJson);
    }

    /**
     * 菜谱推荐
     *
     * @param fridgeId 冰箱id
     * @param num      几道菜
     * @return menuList
     */
    public List<Menu> menuRecommend(Long fridgeId, int num) {
        List<Menu> menuList = menuMapper.selectAllMenu();
        List<UserInfo> userInfoList = userInfoMapper.selectUserByFridgeId(fridgeId);
        List<MenuFavourite> menuFavouriteList = new ArrayList<>();
        List<UserDiet> userDietList = new ArrayList<>();
        for (UserInfo user : userInfoList) {
            menuFavouriteList.addAll(menuFavouriteMapper.selectMenuFavouriteByUserId(user.getId()));
            userDietList.addAll(userDietMapper.selectDietByUser(user.getId().intValue()));
        }

        List<Food> foodList = foodMapper.selectByFridgeId(fridgeId);
        List<Food> deadlineFood = foodMapper.firstFourDeadlineFood(fridgeId);

        PointCalculater.countPoints(menuList, userInfoList, menuFavouriteList, foodList, deadlineFood, userDietList);

        PriorityQueue<Menu> queue = new PriorityQueue<>(Comparator.comparingDouble(Menu::getPoint).reversed());
        //queue.addAll(menuList);
        for (Menu menu : menuList) {
            if (menu.getPoint() >= 0) {
                queue.add(menu);
            }
        }
        List<Menu> recommendMenuList = new ArrayList<>();
        while (num-- > 0 && !queue.isEmpty()) {
            recommendMenuList.add(queue.poll());
        }

        return recommendMenuList;
    }
}
