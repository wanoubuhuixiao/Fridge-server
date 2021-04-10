package org.fridge.mapper;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.fridge.model.MenuFavourite;
import org.fridge.model.RawMenuFavourite;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MenuFavouriteMapper {
    @Select("select * from menu_favourite where userId = #{user_id}")
    @Results(
            value = {
                    @Result(
                            property = "menu", column = "id", javaType = org.fridge.model.Menu.class,
                            one = @One(select = "org.fridge.mapper.MenuMapper.selectMenuById", fetchType = FetchType.EAGER)
                    ),
                    @Result(
                            property = "userId", column = "user_id"
                    ),
                    @Result(
                            property = "favouriteTime", column = "favourite_time"
                    )
            }
    )
    List<MenuFavourite> selectMenuFavouriteByUserId(Long user_id);

    /**
     * 添加
     */
    @Insert("insert into menu_favourite(id, favouriteTime, userid) values (#{menuId}, #{favouriteTime}, #{userId})")
    int insertMenuFavourite(RawMenuFavourite rawMenuFavourite);

    /**
     * 删除
     */
    @Delete("delete from menu_favourite where id = #{menuId} and userid = #{userId}")
    int deleteMenuFavourite(Integer menuId, Integer userId);

}
