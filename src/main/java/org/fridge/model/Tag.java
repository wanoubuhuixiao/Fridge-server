package org.fridge.model;


public class Tag {

    private Long id;
    private String describe;


    public Tag(long id, String describe) {
        this.id = id;
        this.describe = describe;
    }

    public Tag(String describe) {
        this.describe = describe;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

}
