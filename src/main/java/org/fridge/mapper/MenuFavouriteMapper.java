package org.fridge.mapper;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.fridge.model.MenuFavourite;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MenuFavouriteMapper {
    @Select("select * from menu_favourite where user_id = #{user_id}")
    @Results(
            value = {
                    @Result(
                            property = "menu", column = "id", javaType = org.fridge.model.Menu.class,
                            one = @One(select = "org.fridge.mapper.MenuMapper.selectMenuById", fetchType = FetchType.EAGER)
                    ),
                    @Result(
                            property = "userId",column = "user_id"
                    ),
                    @Result(
                            property = "favouriteTime",column = "favourite_time"
                    )
            }
    )
    List<MenuFavourite> selectMenuFavouriteByUserId(int user_id);

}
