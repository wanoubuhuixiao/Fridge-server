package org.fridge.model;


public class UserInfo {

    private long id;
    private long fridgeId;
    private String role;
    private String name;
    private double weight;
    private double bodyFat;
    private String password;
    private String email;


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


    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }


    public double getBodyFat() {
        return bodyFat;
    }

    public void setBodyFat(double bodyFat) {
        this.bodyFat = bodyFat;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
