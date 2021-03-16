package org.fridge.model;


public class FoodWarehouse {

    private Long id;
    private String foodName;
    private Long freezerShelfLife;
    private Long refrigeratorShelfLife;
    private Long whetherOpen;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }


    public Long getFreezerShelfLife() {
        return freezerShelfLife;
    }

    public void setFreezerShelfLife(Long freezerShelfLife) {
        this.freezerShelfLife = freezerShelfLife;
    }


    public Long getRefrigeratorShelfLife() {
        return refrigeratorShelfLife;
    }

    public void setRefrigeratorShelfLife(Long refrigeratorShelfLife) {
        this.refrigeratorShelfLife = refrigeratorShelfLife;
    }


    public Long getWhetherOpen() {
        return whetherOpen;
    }

    public void setWhetherOpen(Long whetherOpen) {
        this.whetherOpen = whetherOpen;
    }

}
