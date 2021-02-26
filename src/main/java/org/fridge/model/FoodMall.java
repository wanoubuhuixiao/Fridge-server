package org.fridge.model;


import java.util.Date;

public class FoodMall {

    private long id;
    private String name;
    private Date productionDate;
    private long shelfLife;
    private double weight;


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


    public java.util.Date getProductionDate() {
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


    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

}
