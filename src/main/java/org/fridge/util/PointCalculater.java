package org.fridge.util;

import com.alibaba.fastjson.JSONArray;
import org.fridge.model.*;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Component
public class PointCalculater {
    /**
     * 计算所有菜谱的点数，并赋值给对应的menu对象的point属性
     *
     * @param menuList          所有菜谱
     * @param userInfoList      对应冰箱id的所有用户信息列表
     * @param menuFavouriteList 对应冰箱id的所有用户的收藏列表，可重复
     * @param foodList          冰箱里现在有的食物
     * @param deadlineFood      最临近过期的食物
     * @param userDietList      对应冰箱id的所有用户忌口列表
     */
    public static void countPoints(List<Menu> menuList, List<UserInfo> userInfoList, List<MenuFavourite> menuFavouriteList, List<Food> foodList, List<Food> deadlineFood, List<UserDiet> userDietList) {
        //喜好相关：用户收藏的菜谱的tag统计<tagId, 出现次数>
        HashMap<Integer, Integer> favouriteTagId;
        //喜好：年龄相关的tag
        HashMap<Integer, Integer> ageTastesTagId = new HashMap<>();
        //健康相关：年龄段需要的营养、BMI、体脂率
        HashMap<Integer, Integer> healthTagId = new HashMap<>();

        //用户忌口食物<foodId, 1>
        HashMap<Integer, Integer> dietFoodID = new HashMap<>();
        //用户忌口tag<tagId, 1>
        HashMap<Integer, Integer> dietTagID = new HashMap<>();

        //List<Integer> favouriteTagId = new ArrayList<>();
        //遍历收藏菜谱
        favouriteTagId = menuFavouriteList
                .stream().parallel()
                .filter(menuFavourite -> menuFavourite.getMenu() != null)
                .map(menuFavourite -> menuFavourite.getMenu().getTag())
                .map(JSONArray::parseArray)
                .flatMap(Collection::stream)
                .map(o -> Integer.parseInt(o.toString()))
                .collect(Collectors.toMap(tag -> tag, tag -> 1, Integer::sum, HashMap::new));

        //遍历所有用户
        //int year = userInfo.getBirthday().getYear();
        //年龄相关
        //身高体重体脂相关
        userInfoList.forEach(userInfo -> {
            Boolean sex = userInfo.getSex();
            if (userInfo.getBirthday() != null) {
                SimpleDateFormat sformat = new SimpleDateFormat();
                sformat.applyPattern("yyyy");
                int year = Integer.parseInt(sformat.format(userInfo.getBirthday()));
                Calendar cal = Calendar.getInstance();
                int currentYear = cal.get(Calendar.YEAR);
                int age = currentYear - year;

                //ageTastesTagId:
                if (age <= 3) {
                    ageTastesTagId.merge(211, 1, Integer::sum);//211为“婴幼儿”tag的id
                } else if (age < 18) {
                    ageTastesTagId.merge(210, 1, Integer::sum);//210为“儿童”tag的id
                } else if (age > 60) {
                    ageTastesTagId.merge(212, 1, Integer::sum);//212为“老人”tag的id
                }

                //ageHealthTagId:
                if (age >= 10 && age <= 13) {
                    healthTagId.merge(138, 1, Integer::sum);//高钙
                } else if (age >= 14 && age <= 18) {
                    healthTagId.merge(140, 1, Integer::sum);//铁
                } else if (age >= 19 && age <= 25) {
                    healthTagId.merge(141, 1, Integer::sum);//维生素C
                } else if (age >= 26 && age <= 35 && sex != null && !sex) {//女性
                    healthTagId.merge(143, 1, Integer::sum);//叶酸
                } else if (age >= 36 && age <= 45) {
                    healthTagId.merge(173, 1, Integer::sum);//水果（抗氧化剂）
                    healthTagId.merge(171, 1, Integer::sum);//蔬菜（抗氧化剂）
                } else if (age >= 46 && age <= 60) {
                    healthTagId.merge(133, 1, Integer::sum);//低脂
                    healthTagId.merge(142, 1, Integer::sum);//高纤
                } else if (age >= 61) {
                    healthTagId.merge(151, 1, Integer::sum);//坚果
                    healthTagId.merge(138, 1, Integer::sum);//高钙
                }

            }
            Double height = userInfo.getHeight();
            Double weight = userInfo.getWeight();
            if (height != null && weight != null) {
                double BMI = weight / height / height * 10000;
                if (BMI >= 24) {
                    int parameter = (int) (BMI - 23);
                    healthTagId.merge(202, parameter, Integer::sum);//202减肥
                }
            }
            Double fat = userInfo.getBodyFat();
            if (fat != null) {
                if (fat > 25 || (sex != null && sex && fat > 18)) {
                    healthTagId.merge(133, 1, Integer::sum);//133低脂
                }
            }
        });

        //冰箱里的食物
        //<食物id, 相关参数>
        HashMap<Long, Integer> foodInFridge = foodList.stream().collect(Collectors.toMap(Food::getId, food -> 1, Integer::sum, HashMap::new));
        //临期的再多1
        deadlineFood.forEach(food -> foodInFridge.merge(food.getId(), 1, Integer::sum));

        //忌口食物和tag
        for (UserDiet userDiet : userDietList) {
            if (userDiet.getType()) {//tag
                dietTagID.put(userDiet.getFoodORtag_id(), 1);
            } else {//食物
                dietFoodID.put(userDiet.getFoodORtag_id(), 1);
            }
        }
        int dietTagIDSize = dietTagID.size();
        int dietFoodIDSize = dietFoodID.size();

        //遍历菜谱
        menuList.stream().parallel().forEach(menu -> {
            boolean flag = true;

            String tags = menu.getTag();
            JSONArray tagsJsonArray = JSONArray.parseArray(tags);

            if (dietTagIDSize != 0) {//检查忌口tag
                //遍历这道菜的tag，看是否有忌口
                flag = tagsJsonArray.stream().map(o -> Integer.parseInt(o.toString())).map(dietTagID::get).noneMatch(Objects::nonNull);
            }


            if (dietFoodIDSize != 0) {//检查忌口食物
                //遍历菜谱的原料
                if (menu.getIngredientsList().stream().map(ingredient -> dietFoodID.get(ingredient.getId().intValue())).anyMatch(Objects::nonNull)) {
                    flag = false;
                }
            }

            if (!flag) {
                menu.setPoint(Integer.MIN_VALUE);
            }
            double tastesPoints = 0;//喜好相关的分数
            double healthPoints = 0;//健康相关的分数
            double foodPoints;//冰箱里的食物的分数

            for (Object o : tagsJsonArray) {//遍历这道菜的tag
                Integer tagId = Integer.parseInt(o.toString());

                Integer tagParameter1 = favouriteTagId.get(tagId);
                if (tagParameter1 != null) {//收藏菜谱里的tag
                    tastesPoints += tagParameter1;
                }
                Integer tagParameter2 = ageTastesTagId.get(tagId);
                if (tagParameter2 != null) {//根据用户年龄猜测可能喜欢的tag
                    tastesPoints += 0.5 * tagParameter2;
                }

                //健康相关
                Integer tagParameter3 = healthTagId.get(tagId);
                if (tagParameter3 != null) {
                    healthPoints += tagParameter3;
                }
            }

            //冰箱食物相关
            //遍历菜谱的原料
            foodPoints = menu.getIngredientsList()
                    .stream()
                    .map(ingredient -> foodInFridge.get(ingredient.getId()))
                    .mapToDouble(foodParameter -> foodParameter)
                    .sum();

            double totalPoints = tastesPoints * 0.4 + healthPoints * 0.4 + foodPoints * 0.2;
            menu.setPoint(totalPoints);

        });//遍历菜谱结束
    }
}
