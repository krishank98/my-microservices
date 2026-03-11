package com.example.marital.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "users")
public class MaritalStatusDocument {

    @Id
    private String id;

    private String type;
    private String value;

    public MaritalStatusDocument() {}

    public MaritalStatusDocument(String type, String value) {
        this.type = type;
        this.value = value;
    }

    public String getId() {
        return id;
    }

    public String getType() {
        return type;
    }

    public String getValue() {
        return value;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setValue(String value) {
        this.value = value;
    }
}