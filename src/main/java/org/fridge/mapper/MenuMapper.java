package org.fridge.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.fridge.model.Menu;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MenuMapper {
    @Update(value = {"update menu set tag=#{tag} where id=#{id}"})
    int updateTag(String tag, long id);

    @Select(value = {"select * from menu where id=#{id}"})
    Menu select(long id);

    @Select(value = {"select * from menu where tag is null limit 1"})
    Menu selectNullTagItem();

    //用食物名称获得食物id
    @Select(value = {"select id from food_warehouse where foodName=#{foodname}"})
    Integer selectFoodIdByName(String foodname);

    //用食材id获得相关的菜谱id
    @Select(value = {"select menu_id from menu_food where food_id=#{foodid}"})
    List<Integer> selectMenuByFood(Integer foodid);

    //用菜谱id查菜谱
    @Select(value={"select * from menu where id=#{id}"})
    Menu selectMenuById(Integer id);

    //(用户)菜名模糊查询菜谱
    @Select(value={"select * from menu where name like '%#{menuname}%'"})
    List<Menu> selectMenuByName(String menuname);

    //根据tagid查菜谱id
    @Select(value={"select menu_id from menu_tag where tag_id=#{tagId}"})
    List<Integer> selectMenuByTag(Integer tagId);

    //根据tag名称查tagid
    @Select(value = {"select id from tag where `describe`=#{describe}"})
    Integer selectTagIdByName(String describe);

    //所有菜谱
    @Select(value = {"select * from menu"})
    List<Menu> selectAllMenu();

}