package org.fridge.model;


public class MenuFood {

    private Menu menuId;
    private FoodWarehouse foodId;


    public Menu getMenuId() {
        return menuId;
    }

    public void setMenuId(Menu menuId) {
        this.menuId = menuId;
    }


    public FoodWarehouse getFoodId() {
        return foodId;
    }

    public void setFoodId(FoodWarehouse foodId) {
        this.foodId = foodId;
    }

}
