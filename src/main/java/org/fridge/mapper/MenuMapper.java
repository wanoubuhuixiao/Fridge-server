package org.fridge.mapper;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.fridge.model.FoodWarehouse;
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


    /**
     * 用菜谱id查菜谱
     */
    @Results({
                @Result(property = "id", column = "id", id = true),
                @Result(
                        property = "ingredientsList", column = "id",
                        many = @Many(select = "org.fridge.mapper.MenuMapper.selectFoodWarehouseByMenuId", fetchType = FetchType.LAZY)
                )
            })
    @Select(value = {"select * from menu where id=#{id}"})
    @ResultType(Menu.class)
    Menu selectMenuById(int id);

    /**
     *根据菜谱id查出原料列表
     */
    @Select("select fw.* from menu_food mf,food_warehouse fw where mf.food_id = fw.id and mf.menu_id=#{menuId}")
    List<FoodWarehouse> selectFoodWarehouseByMenuId(Integer menuId);

    /**
     * (用户)菜名模糊查询菜谱
     */
    @Select(value = {"select * from menu where name like concat('%', #{menu}, '%')"})
    List<Menu> selectMenuByName(String menuname);

    /**
     * 所有菜谱
     */
    @Results({
            @Result(property = "id", column = "id", id = true),
            @Result(
                    property = "ingredientsList", column = "id",
                    many = @Many(select = "org.fridge.mapper.MenuMapper.selectFoodWarehouseByMenuId", fetchType = FetchType.LAZY)
            )
    })
    @Select(value = {"select * from menu"})
    List<Menu> selectAllMenu();

    /**
     * 查前n条菜谱
     */
    @Select(value = {"select * from menu limit #{num}"})
    List<Menu> selectLimitMenu(int num);

}