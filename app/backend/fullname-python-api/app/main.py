from fastapi import FastAPI
from app.redis_client import redis_client
from app.database import collection
from app.models import UserResponse

app = FastAPI()


@app.get("/fullname", response_model=UserResponse)
def get_fullname():

    cache_key = "user:fullname"

    cached_data = redis_client.get(cache_key)

    if cached_data:
        return {
            "source": "redis",
            "fullname": cached_data
        }

    user = collection.find_one({"type": "fullname"})

    if not user:
        return {"error": "not found"}

    fullname = user["value"]

    redis_client.set(cache_key, fullname, ex=300)

    return {
        "source": "mongodb",
        "fullname": fullname
    }