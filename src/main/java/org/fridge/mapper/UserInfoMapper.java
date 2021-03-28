package org.fridge.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.fridge.model.UserInfo;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface UserInfoMapper {
    /**
     * 根据冰箱id查所有对应用户
     * @param fridgeId 冰箱id
     * @return 对应冰箱的所有用户构成的List
     */
    @Select(value = {"select * from user_info where fridgeId=#{fridgeId}"})
    List<UserInfo> selectUserByFridgeId(Long fridgeId);
}
