package org.fridge.model;

import com.alibaba.fastjson.JSONArray;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.ArrayList;
import java.util.List;
@JsonIgnoreProperties(value = {"handler"})
public class Menu {
    private Long id;
    private String name;
    private String largeImg;
    private String smallImg;
    private String steps;
    private String ingredients;
    private String tag;

    private List<FoodWarehouse> ingredientsList;//食材列表
    private List<Tag> tagList;//tag列表

    //菜谱推荐时比较用的点数
    private double point = 0;//初始化为0

    public List<FoodWarehouse> getIngredientsList() {
        return ingredientsList;
    }

    public void setTagList(List<Tag> tagList) {
        this.tagList = tagList;
    }

    public List<Tag> getTagList() {
        return tagList;
    }

    public void setIngredientsList(List<FoodWarehouse> ingredientsList) {
        this.ingredientsList = ingredientsList;
    }

    public Menu(long id, String name, String largeImg, String smallImg, String steps, String ingredients, String tag) {
        this.id = id;
        this.name = name;
        this.largeImg = largeImg;
        this.smallImg = smallImg;
        this.steps = steps;
        this.ingredients = ingredients;
        this.tag = tag;
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

    public Menu() {
    }
}
