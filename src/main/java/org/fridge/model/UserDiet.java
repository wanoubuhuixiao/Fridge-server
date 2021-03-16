package org.fridge.model;

public class UserDiet {

    private Integer user_id;
    private Integer foodORtag_id;
    private Boolean type;

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getFoodORtag_id() {
        return foodORtag_id;
    }

    public void setFoodORtag_id(Integer foodORtag_id) {
        this.foodORtag_id = foodORtag_id;
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }
}
