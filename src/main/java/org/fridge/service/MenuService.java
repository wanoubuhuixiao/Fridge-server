package org.fridge.service;

import net.sf.json.JSONObject;
import org.fridge.mapper.MenuFavouriteMapper;
import org.fridge.mapper.MenuMapper;
import org.fridge.model.Menu;
import org.fridge.model.common.ApiResponse;
import org.fridge.model.common.Responses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuService {
    MenuMapper menuMapper;

    @Autowired
    public void setMenuMapper(MenuMapper menuMapper) {
        this.menuMapper = menuMapper;
    }

    public ApiResponse<Menu> selectNullTagItem() {
        return Responses.ok(menuMapper.selectNullTagItem());
    }

    public ApiResponse<Object> updateTag(String tag, long id) {
        int result = menuMapper.updateTag(tag, id);
        if (result == 1) {
            return Responses.ok();
        } else {
            return Responses.fail();
        }
    }

    public List<Menu> MenuQueryByName(String menu) {
        return menuMapper.selectMenuByName(menu);
    }

    public List<Menu> selectLimitMenu(int num) {
        return menuMapper.selectLimitMenu(num);
    }

    public Menu selectMenuById(int id) {
        return menuMapper.selectMenuById(id);
    }

    public ApiResponse<Object> SpeakMenuQuery(String menu) {
        String service = "menu";
        JSONObject resultJson = new JSONObject();

        List<Menu> menuList = MenuQueryByName(menu);
        resultJson.put("service", service);
        if (menuList.isEmpty()) {
            return Responses.fail("目前菜谱里没有这种菜，我会努力学习的！");
        }
        resultJson.put("result", menuList.get(0));
        return Responses.ok(resultJson);
    }

    /**
     * 菜谱推荐
     * @param num 几道菜
     * @return menuList
     */
//    public List<Menu> menuRecommend(int num){
//
//    }
}
