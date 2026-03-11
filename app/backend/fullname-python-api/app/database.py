import os
from pymongo import MongoClient

MONGO_URI = os.getenv(
    "MONGO_URI",
    "mongodb://appuser:apppassword@mongodb:27017/demo"
)

client = MongoClient(MONGO_URI)

db = client["demo"]

collection = db["users"]