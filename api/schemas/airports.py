from typing import Optional, List
from pydantic import BaseModel
from datetime import datetime
from enum import Enum
from uuid import UUID


class CreateAirportSchema(BaseModel):
    iata_code: str
    airport: str
    city: str
    state: str
    country: str
    latitude: float
    longitude: float


class GetAirportSchema(CreateAirportSchema):
    airport_id: UUID


class GetAirportsSchema(BaseModel):
    airports: List[GetAirportSchema]
