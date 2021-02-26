package org.fridge.model;


public class Seasoning {

    private long id;
    private long fridgeId;
    private double weight;
    private long seasoningStatus;
    private String name;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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


    public long getSeasoningStatus() {
        return seasoningStatus;
    }

    public void setSeasoningStatus(long seasoningStatus) {
        this.seasoningStatus = seasoningStatus;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
