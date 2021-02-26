package org.fridge.model;


import java.util.Date;

public class Food {

    private long id;
    private String foodName;
    private Date productionDate;
    private long shelfLife;
    private long freezer;
    private long level;
    private long defrost;
    private long fridgeId;
    private double weight;


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


    public Date getProductionDate() {
        return productionDate;
    }

    public void setProductionDate(Date productionDate) {
        this.productionDate = productionDate;
    }


    public long getShelfLife() {
        return shelfLife;
    }

    public void setShelfLife(long shelfLife) {
        this.shelfLife = shelfLife;
    }


    public long getFreezer() {
        return freezer;
    }

    public void setFreezer(long freezer) {
        this.freezer = freezer;
    }


    public long getLevel() {
        return level;
    }

    public void setLevel(long level) {
        this.level = level;
    }


    public long getDefrost() {
        return defrost;
    }

    public void setDefrost(long defrost) {
        this.defrost = defrost;
    }


    public long getFridgeId() {
        return fridgeId;
    }

    public void setFridgeId(long fridgeId) {
        this.fridgeId = fridgeId;
    }


    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

}
