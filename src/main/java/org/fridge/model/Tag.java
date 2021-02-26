package org.fridge.model;


public class Tag {

    private long id;
    private String describe;


    public Tag(long id, String describe) {
        this.id = id;
        this.describe = describe;
    }

    public Tag(String describe) {
        this.describe = describe;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

}
