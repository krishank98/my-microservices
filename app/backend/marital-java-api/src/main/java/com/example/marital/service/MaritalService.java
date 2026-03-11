package com.example.marital.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import com.example.marital.model.MaritalStatus;
import com.example.marital.model.MaritalStatusDocument;
import com.example.marital.repository.MaritalRepository;

import java.util.concurrent.TimeUnit;

@Service
public class MaritalService {

    @Autowired
    private MaritalRepository repository;

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    public MaritalStatus getMaritalStatus() {

        String cacheKey = "user:marital";

        // 1️⃣ Check Redis
        String cached = redisTemplate.opsForValue().get(cacheKey);

        if (cached != null) {
            return new MaritalStatus("redis", cached);
        }

        // 2️⃣ Query MongoDB
        MaritalStatusDocument doc = repository.findByType("marital");

        if (doc == null) {
            return new MaritalStatus("error", "not found");
        }

        String status = doc.getValue();

        // 3️⃣ Save to Redis (TTL 5 minutes)
        redisTemplate.opsForValue().set(cacheKey, status, 300, TimeUnit.SECONDS);

        return new MaritalStatus("mongodb", status);
    }
}