from typing import Optional, List, Union
from pydantic import BaseModel, validator
from datetime import datetime
from enum import Enum
from uuid import UUID
from math import isnan


class Status(Enum):
    """
    """
    landed = "landed"
    cancelled = "cancelled"
    diverted = "diverted"


class CreateFlightSchema(BaseModel):
    airline_id: UUID  # Foreign key
    origin_airport_id: UUID  # Foreign key
    destination_airport_id: UUID  # Foreign key
    distance: int
    scheduled_departure: datetime
    scheduled_arrival: datetime
    arrival_delay: Optional[int]
    status: Status
    cancellation_reason: Optional[str]
    air_system_delay: bool
    security_delay: bool
    airline_delay: bool
    late_aircraft_delay: bool
    weather_delay: bool

    @validator("cancellation_reason", 
               "arrival_delay",
                pre=True)
    @classmethod
    def change_nan_to_none(cls, 
                           v: Optional[Union[str, float]]):
        """
        Converts nan to None.
        """
        if isinstance(v, float) and isnan(v):
            return None
        return v


class GetFlightSchema(CreateFlightSchema):
    flight_id: UUID  # Primary key


class GetFlightsSchema(BaseModel):
    flights: List[GetFlightSchema]
