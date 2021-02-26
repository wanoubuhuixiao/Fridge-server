package org.fridge.model;


public class FoodWarehouse {

    private long id;
    private String foodName;
    private long freezerShelfLife;
    private long refrigeratorShelfLife;
    private long whetherOpen;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }


    public long getFreezerShelfLife() {
        return freezerShelfLife;
    }

    public void setFreezerShelfLife(long freezerShelfLife) {
        this.freezerShelfLife = freezerShelfLife;
    }


    public long getRefrigeratorShelfLife() {
        return refrigeratorShelfLife;
    }

    public void setRefrigeratorShelfLife(long refrigeratorShelfLife) {
        this.refrigeratorShelfLife = refrigeratorShelfLife;
    }


    public long getWhetherOpen() {
        return whetherOpen;
    }

    public void setWhetherOpen(long whetherOpen) {
        this.whetherOpen = whetherOpen;
    }

}
