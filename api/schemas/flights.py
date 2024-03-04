from typing import Optional, List
from pydantic import BaseModel
from datetime import datetime
from enum import Enum
from uuid import UUID


class Status(Enum):
    """
    """
    landed = "landed"
    cancelled = "cancelled"
    diverted = "diverted"


class CreateFlightSchema(BaseModel):
    airline_id: UUID # Foreign key
    origin_airport_id: UUID # Foreign key
    destination_airport_id: UUID # Foreign key
    scheduled_departure: datetime
    scheduled_arrival: datetime
    arrival_delay: int
    status: Status
    cancellation_reason: Optional[str]
    air_system_delay: bool
    security_delay: bool
    airline_delay: bool
    late_aircraft_delay: bool
    weather_delay: bool


class GetFlightSchema(CreateFlightSchema):
    flight_id: UUID # Primary key


class GetFlightsSchema(BaseModel):
    flights: List[GetFlightSchema]