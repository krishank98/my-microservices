const express = require("express");
const redis = require("redis");
const { MongoClient } = require("mongodb");

const app = express();
const PORT = process.env.PORT || 3001;

// ENV variables
const REDIS_URL = process.env.REDIS_URL || "redis://redis:6379";
const MONGO_URI = process.env.MONGO_URI || "mongodb://appuser:apppassword@mongodb:27017/demo";

// Redis connection
const redisClient = redis.createClient({
  url: REDIS_URL
});

redisClient.on("error", (err) => {
  console.error("Redis error:", err);
});

redisClient.connect();

// MongoDB connection
const mongoClient = new MongoClient(MONGO_URI);

let collection;

async function connectDB() {
  try {
    await mongoClient.connect();
    const db = mongoClient.db("demo");
    collection = db.collection("users");
    console.log("MongoDB connected");
  } catch (err) {
    console.error("MongoDB connection failed:", err);
  }
}

connectDB();

app.get("/location", async (req, res) => {
  const cacheKey = "user:location";

  try {

    // 1️⃣ Check Redis
    const cached = await redisClient.get(cacheKey);

    if (cached) {
      return res.json({
        source: "redis",
        location: cached
      });
    }

    // 2️⃣ Query MongoDB
    const user = await collection.findOne({ type: "location" });

    if (!user) {
      return res.json({ error: "not found" });
    }

    const location = user.value;

    // 3️⃣ Save to Redis
    await redisClient.set(cacheKey, location, {
      EX: 300
    });

    res.json({
      source: "mongodb",
      location: location
    });

  } catch (err) {
    console.error(err);
    res.status(500).json({ error: "internal server error" });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});