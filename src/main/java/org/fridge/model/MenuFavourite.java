package org.fridge.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.Date;
@JsonIgnoreProperties(value = {"handler"})
public class MenuFavourite {
    public Menu menu;
    public Date favouriteTime;
    public Integer userId;

    public MenuFavourite(Menu menu, Date favouriteTime, Integer userId) {
        this.menu = menu;
        this.favouriteTime = favouriteTime;
        this.userId = userId;
    }

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
