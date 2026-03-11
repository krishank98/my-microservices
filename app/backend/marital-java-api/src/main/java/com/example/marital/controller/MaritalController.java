package com.example.marital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.marital.service.MaritalService;
import com.example.marital.model.MaritalStatus;

@RestController
public class MaritalController {

    @Autowired
    private MaritalService maritalService;

    @GetMapping("/marital-status")
    public MaritalStatus getStatus() {

        return maritalService.getMaritalStatus();

    }
}