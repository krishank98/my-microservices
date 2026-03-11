from pydantic import BaseModel


class UserResponse(BaseModel):
    source: str
    fullname: str


class LocationResponse(BaseModel):
    source: str
    location: str