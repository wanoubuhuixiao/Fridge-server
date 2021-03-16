package org.fridge.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.fridge.model.UserDiet;
import org.springframework.stereotype.Repository;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

@Mapper
@Repository
public interface UserDietMapper {

    @Insert(value = {"insert into user_diet(user_id, foodORtag_id, type) values(#{user_id}, #{foodORtag_id}, #{type})"})
    int insertUserDiet(UserDiet userDiet) throws SQLIntegrityConstraintViolationException;

    /**
     * 删除“不吃的食物”，需要提供三个参数（联合主键），即UserDiet类对象
     */
    @Delete(value = {"delete from user_diet where user_id=#{user_id} and foodORtag_id=#{foodORtag_id} and type=#{type}"})
    int deleteUserDiet(UserDiet userDiet);

    /**
     *根据用户id查他不吃的所有东西
     */
    @Select(value = {"select * from user_diet where user_id=#{userId}"})
    List<UserDiet> selectDietByUser(Integer userId);

//    /**
//     * @param userDiet 用户新建的不吃的食物
//     * @return 是否存在
//     */
//    @Select(value = {"select count(*) from user_diet where user_id=#{user_id} and foodORtag_id=#{foodORtag_id} and type=#{type}"})
//    int selectIsExist(UserDiet userDiet);

}
