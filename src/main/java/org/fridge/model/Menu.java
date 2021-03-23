package org.fridge.model;

import com.alibaba.fastjson.JSONArray;

import java.util.ArrayList;
import java.util.List;

public class Menu {
    private Long id;
    private String name;
    private String largeImg;
    private String smallImg;
    private String steps;
    private String ingredients;
    private String tag;

    //菜谱推荐时比较用的点数
    private double point;

    public Menu(long id, String name, String largeImg, String smallImg, String steps, String ingredients, String tag) {
        this.id = id;
        this.name = name;
        this.largeImg = largeImg;
        this.smallImg = smallImg;
        this.steps = steps;
        this.ingredients = ingredients;
        this.tag = tag;
    }

    public Menu() {

    }

    /**
     *计算所有菜谱的点数，并赋值给对应的menu对象的point属性
     * @param menuList 所有菜谱
     * @param userInfoList 对应冰箱id的所有用户
     * @param userDietList
     * @param menuFavouriteList
     * @param foodList
     */
    public static void countPoints(List<Menu> menuList, List<UserInfo> userInfoList, List<UserDiet> userDietList, List<MenuFavourite> menuFavouriteList, List<Food> foodList){
        List<Tag> favouriteTag = new ArrayList<>();
        for (MenuFavourite menuFavourite: menuFavouriteList) {
            String tags = menuFavourite.getMenu().getTag();
            JSONArray tagsJsonArray = JSONArray.parseArray(tags);
            for (Object o: tagsJsonArray) {
                int tag = Integer.parseInt(o.toString());

            }
            //favouriteTag.add()

        }
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public String getLargeImg() {
        return largeImg;
    }

    public void setLargeImg(String largeImg) {
        this.largeImg = largeImg;
    }


    public String getSmallImg() {
        return smallImg;
    }

    public void setSmallImg(String smallImg) {
        this.smallImg = smallImg;
    }


    public String getSteps() {
        return steps;
    }

    public void setSteps(String steps) {
        this.steps = steps;
    }


    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }


    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public double getPoint() {
        return point;
    }

    public void setPoint(double point) {
        this.point = point;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "name='" + name + '\'' +
                ", largeImg='" + largeImg + '\'' +
                ", smallImg='" + smallImg + '\'' +
                ", tag='" + tag + '\'' +
                '}';
    }
}
