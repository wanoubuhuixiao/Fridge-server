package org.fridge.model;


public class Seasoning {

    private Long id;
    private Long fridgeId;
    private Double weight;
    private Long seasoningStatus;
    private String name;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public Long getFridgeId() {
        return fridgeId;
    }

    public void setFridgeId(Long fridgeId) {
        this.fridgeId = fridgeId;
    }


    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }


    public Long getSeasoningStatus() {
        return seasoningStatus;
    }

    public void setSeasoningStatus(Long seasoningStatus) {
        this.seasoningStatus = seasoningStatus;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
