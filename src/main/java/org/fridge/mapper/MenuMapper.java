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


    /**
     * 用菜谱id查菜谱
     */
    @Select(value = {"select * from menu where id=#{id}"})
    Menu selectMenuById(Integer id);

    /**
     * (用户)菜名模糊查询菜谱
     */
    @Select(value = {"select * from menu where name like '%#{menuname}%'"})
    List<Menu> selectMenuByName(String menuname);

    /**
     * 所有菜谱
     */
    @Select(value = {"select * from menu"})
    List<Menu> selectAllMenu();

}