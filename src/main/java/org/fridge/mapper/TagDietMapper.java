package org.fridge.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.fridge.model.Diet;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TagDietMapper {
    /**
     * 根据名称查询id，返回不为null表示有这个种类的tag可以选为“不吃的食物
     */
    @Select(value = {"select id from tag_diet where `describe`=#{name}"})
    String selectTagDiet(String name);

    /**
     * @param id 表中行的id
     * @return tag_id 对应的tag的id
     */
    @Select(value = {"select tag_id from tag_diet where id=#{id}"})
    Integer selectTagIDByID(String id);

    /**
     * 模糊匹配tag名称
     *
     * @param describe 输入的（部分）tag名称
     * @return 能模糊匹配到的Diet
     */
    @Select(value = {"select id as id, `describe` as name from tag_diet where `describe` like concat('%', #{describe}, '%') limit 10"})
    List<Diet> selectDietFuzzy(String describe);

}
