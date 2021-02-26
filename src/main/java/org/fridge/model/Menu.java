package org.fridge.model;


public class Menu {

    private long id;
    private String name;
    private String largeImg;
    private String smallImg;
    private String steps;
    private String ingredients;
    private String tag;


    public long getId() {
        return id;
    }

    public void setId(long id) {
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

}
