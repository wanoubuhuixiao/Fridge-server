package org.fridge.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface menuTagMapper {
    /**
     * 根据tagid查菜谱id
     * @param tagId tag的ID
     * @return 查出的ID
     * @author 仓谷
     */
    @Select(value = {"select menu_id from menu_tag where tag_id=#{tagId}"})
    List<Integer> selectMenuByTag(Integer tagId);
}
