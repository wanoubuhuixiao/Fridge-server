package org.fridge.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.fridge.model.Menu;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MenuMapper {
    @Update(value = {"update menu set tag=#{tag} where id=#{id}"})
    int updateTag(String tag, long id);

    @Select(value = {"select * from menu where id=#{id}"})
    Menu select(long id);

    @Select(value = {"select * from menu where tag is null limit 1"})
    Menu selectNullTagItem();
}