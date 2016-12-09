package com.polubinskas.ajaxtest.models;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Created by HP on 08.12.2016.
 */

@Document
public class ProductDoc {
    @Id
    private ObjectId id;
    private String title;
    private String description;
    private Double price;
    private ObjectId owner;

    public ObjectId getId() {
        return id;
    }

    public void setId(ObjectId id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public ObjectId getOwner() {
        return owner;
    }

    public void setOwner(ObjectId owner) {
        this.owner = owner;
    }
}
