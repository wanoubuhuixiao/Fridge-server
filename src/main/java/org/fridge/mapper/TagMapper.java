package org.fridge.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.fridge.model.Tag;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TagMapper {
    @Insert(value = {"insert into tag(`describe`) values (#{describe})"})
    int insert(Tag tag);

    @Delete(value = {"delete from tag where `id`=#{id}"})
    int deleteById(long id);

    @Delete(value = {"delete from tag where `describe`=#{describe}"})
    int deleteByDescribe(String describe);

    @Select(value = {"select * from tag"})
    List<Tag> selectAll();

    @Select(value = {"select * from tag where `describe` like concat('%', #{describe}, '%') limit 10;"})
    List<Tag> fuzzy(String describe);
}
