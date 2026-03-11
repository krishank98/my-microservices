package com.example.marital.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.example.marital.model.MaritalStatusDocument;

@Repository
public interface MaritalRepository extends MongoRepository<MaritalStatusDocument, String> {

    MaritalStatusDocument findByType(String type);

}