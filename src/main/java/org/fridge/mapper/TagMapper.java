package org.fridge.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.fridge.model.Tag;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TagMapper {
    @Insert(value = {"insert into tag(`describe`) values (#{describe})"})
    int insert(Tag tag);

    @Delete(value = {"delete from tag where `id`=#{id}"})
    int deleteById(long id);

    @Delete(value = {"delete from tag where `describe`=#{describe}"})
    int deleteByDescribe(String describe);
}
