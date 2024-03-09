from typing import Optional, List
from pydantic import BaseModel
from datetime import datetime
from enum import Enum
from uuid import UUID


class CreateAirlineSchema(BaseModel):
    iata_code: str
    airline: str


class GetAirlineSchema(CreateAirlineSchema):
    airline_id: UUID


class GetAirlinesSchema(BaseModel):
    airlines: List[GetAirlineSchema]
