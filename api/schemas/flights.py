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


class FlightSchema(BaseModel):
    flight_id: UUID
    airline_id: UUID # Foreign Key
    origin_airport_id: UUID # Foreign Key
    destination_airport_id: UUID # Foreign Key
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


class GetFlightsSchema(BaseModel):
    flights: List[FlightSchema]