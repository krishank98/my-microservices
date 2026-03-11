package com.example.marital.model;

public class MaritalStatus {

    private String source;
    private String status;

    public MaritalStatus(String source, String status) {
        this.source = source;
        this.status = status;
    }

    public String getSource() {
        return source;
    }

    public String getStatus() {
        return status;
    }
}