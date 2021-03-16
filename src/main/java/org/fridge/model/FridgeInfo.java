package org.fridge.model;


public class FridgeInfo {

    private Long id;
    private String modelType;
    private Double freezerTemp;
    private Double refrigeratorTemp;
    private Double freezerHumidity;
    private Double refrigeratorHumidity;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public String getModelType() {
        return modelType;
    }

    public void setModelType(String modelType) {
        this.modelType = modelType;
    }


    public Double getFreezerTemp() {
        return freezerTemp;
    }

    public void setFreezerTemp(Double freezerTemp) {
        this.freezerTemp = freezerTemp;
    }


    public Double getRefrigeratorTemp() {
        return refrigeratorTemp;
    }

    public void setRefrigeratorTemp(Double refrigeratorTemp) {
        this.refrigeratorTemp = refrigeratorTemp;
    }


    public Double getFreezerHumidity() {
        return freezerHumidity;
    }

    public void setFreezerHumidity(Double freezerHumidity) {
        this.freezerHumidity = freezerHumidity;
    }


    public Double getRefrigeratorHumidity() {
        return refrigeratorHumidity;
    }

    public void setRefrigeratorHumidity(Double refrigeratorHumidity) {
        this.refrigeratorHumidity = refrigeratorHumidity;
    }

}
