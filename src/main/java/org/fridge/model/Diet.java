package org.fridge.model;

/**
 * 用于给用户选择“不能吃的食物”，包括食物和tag
 */

public class Diet {

    private String id;
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


}
