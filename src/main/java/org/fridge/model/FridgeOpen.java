package org.fridge.model;


import java.util.Date;

public class FridgeOpen {

    private long id;
    private long fridgeId;
    private Date time;


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


    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

}
