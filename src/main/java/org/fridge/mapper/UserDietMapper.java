package org.fridge.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.fridge.model.UserDiet;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserDietMapper {
    @Insert(value = {"insert into user_diet(user_id, foodORtag_id, type) values(#{userId}, #{foodORtagId}, #{type})"})
    int insertUserDiet(Integer userId, Integer foodORtagId,  Boolean type);

    /**
     * 删除“不吃的食物”，需要提供三个参数（联合主键）
     * @param userId 用户id
     * @param foodORtagId 不吃的东西id
     * @param type 是具体的食物还是tag
     */
    @Delete(value = {"delete from user_diet where user_id=#{userId} and foodORtag_id=#{foodORtagId} and type=#{type}"})
    int deleteUserDiet(Integer userId, Integer foodORtagId,  Boolean type);

    /**
     *根据用户id查他不吃的所有东西
     */
    @Select(value = {"select * from user_diet where user_id=#{userId}"})
    List<UserDiet> selectDietByUser(Integer userId);
}
