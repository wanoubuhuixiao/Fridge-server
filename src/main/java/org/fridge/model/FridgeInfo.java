package org.fridge.model;


public class FridgeInfo {

    private long id;
    private String modelType;
    private double freezerTemp;
    private double refrigeratorTemp;
    private double freezerHumidity;
    private double refrigeratorHumidity;


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }


    public String getModelType() {
        return modelType;
    }

    public void setModelType(String modelType) {
        this.modelType = modelType;
    }


    public double getFreezerTemp() {
        return freezerTemp;
    }

    public void setFreezerTemp(double freezerTemp) {
        this.freezerTemp = freezerTemp;
    }


    public double getRefrigeratorTemp() {
        return refrigeratorTemp;
    }

    public void setRefrigeratorTemp(double refrigeratorTemp) {
        this.refrigeratorTemp = refrigeratorTemp;
    }


    public double getFreezerHumidity() {
        return freezerHumidity;
    }

    public void setFreezerHumidity(double freezerHumidity) {
        this.freezerHumidity = freezerHumidity;
    }


    public double getRefrigeratorHumidity() {
        return refrigeratorHumidity;
    }

    public void setRefrigeratorHumidity(double refrigeratorHumidity) {
        this.refrigeratorHumidity = refrigeratorHumidity;
    }

}
