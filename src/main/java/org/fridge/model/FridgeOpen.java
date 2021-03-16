package org.fridge.model;


import java.util.Date;

public class FridgeOpen {

    private Long id;
    private Long fridgeId;
    private Date time;


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


    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

}
