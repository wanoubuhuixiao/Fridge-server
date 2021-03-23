package org.fridge.service;

import org.fridge.mapper.FoodWarehouseMapper;
import org.fridge.mapper.TagDietMapper;
import org.fridge.mapper.UserDietMapper;
import org.fridge.model.Diet;
import org.fridge.model.UserDiet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

@Service
public class UserDietService {
    FoodWarehouseMapper foodWarehouseMapper;
    TagDietMapper tagDietMapper;
    UserDietMapper userDietMapper;

    @Autowired
    public void setUserDietMapper(UserDietMapper userDietMapper) {
        this.userDietMapper = userDietMapper;
    }

    @Autowired
    public void setFoodWarehouseMapper(FoodWarehouseMapper foodWarehouseMapper) {
        this.foodWarehouseMapper = foodWarehouseMapper;
    }

    @Autowired
    public void setTagDietMapper(TagDietMapper tagDietMapper) {
        this.tagDietMapper = tagDietMapper;
    }

    /**
     * @param name 食物名称或tag描述
     * @return id 食物id或tagid；如果返回null表示找不到（不可选）这种“不吃的食物”
     */
    public String findTagOrFood(String name) {
        String id;
        //要先找tag，tag找不到才找foodWarehouse
        id = tagDietMapper.selectTagDiet(name);
        if (id == null) {
            id = Integer.toString(foodWarehouseMapper.selectFoodIdByName(name));
            return id;
        }
        return id;
    }

    /**
     * 根据已有的输入模糊匹配出可以选的不吃的食物或者tag
     *
     * @param name 已有的输入
     */
    public List<Diet> selectDietFuzzy(String name) {
        List<Diet> list = tagDietMapper.selectDietFuzzy(name);
        if (list.addAll(foodWarehouseMapper.selectDietFuzzy(name))) {
            return list;
        }
        return null;
    }

    /**
     * 用户添加“不能吃的食物”
     *
     * @param userId 用户id
     * @param id     不能吃的食物或tag的id
     * @return 影响数据库的条数
     */
    public int insertUserDiet(Integer userId, String id) {
        UserDiet userDiet = new UserDiet();
        userDiet.setUser_id(userId);
        if (id.startsWith("T")) {
            Integer tagId = tagDietMapper.selectTagIDByID(id);
            userDiet.setFoodORtag_id(tagId);
            userDiet.setType(true);
        } else {
            Integer foodId = Integer.valueOf(id);
            userDiet.setFoodORtag_id(foodId);
            userDiet.setType(false);
        }
        try {
            return userDietMapper.insertUserDiet(userDiet);
        } catch (SQLIntegrityConstraintViolationException e) {
            e.printStackTrace();
            return -1;
        }
    }

    /**
     * 用户删除“不能吃的食物”
     */
    public int deleteUserDiet(Integer userId, String id) {
        UserDiet userDiet = new UserDiet();
        userDiet.setUser_id(userId);
        if (id.startsWith("T")) {
            Integer tagId = tagDietMapper.selectTagIDByID(id);
            userDiet.setFoodORtag_id(tagId);
            userDiet.setType(true);
        } else {
            Integer foodId = Integer.valueOf(id);
            userDiet.setFoodORtag_id(foodId);
            userDiet.setType(false);
        }
        return userDietMapper.deleteUserDiet(userDiet);
    }

    public List<UserDiet> selectAllDietByUserID(Integer userID) {
        return userDietMapper.selectDietByUser(userID);
    }
}
