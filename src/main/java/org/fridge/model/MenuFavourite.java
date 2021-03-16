package org.fridge.model;

import java.util.Date;

public class MenuFavourite {
    private Menu menu;
    private Date favouriteTime;
    private Integer userId;


    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public Date getFavouriteTime() {
        return favouriteTime;
    }

    public MenuFavourite(Menu menu, Date favouriteTime, int userId) {
        this.menu = menu;
        this.favouriteTime = favouriteTime;
        this.userId = userId;
    }

    public MenuFavourite() {

    }

    @Override
    public String toString() {
        return "MenuFavourite{" +
                "menuId=" + menu +
                ", favouriteTime=" + favouriteTime +
                ", userId=" + userId +
                '}';
    }

    public void setFavouriteTime(Date favouriteTime) {
        this.favouriteTime = favouriteTime;
    }
}
