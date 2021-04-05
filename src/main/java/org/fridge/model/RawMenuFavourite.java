package org.fridge.model;

import java.util.Date;

public class RawMenuFavourite {

    private Integer menuId;
    private Date favouriteTime;
    private Integer userId;

    public RawMenuFavourite(Integer menuId, Date favouriteTime, Integer userId) {
        this.menuId = menuId;
        this.favouriteTime = favouriteTime;
        this.userId = userId;
    }

    public RawMenuFavourite() {
    }

    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }

    public Date getFavouriteTime() {
        return favouriteTime;
    }

    public void setFavouriteTime(Date favouriteTime) {
        this.favouriteTime = favouriteTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
