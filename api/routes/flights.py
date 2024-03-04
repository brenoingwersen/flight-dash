from fastapi import APIRouter, Depends
from schemas.flights import GetFlightsSchema
from uuid import uuid4
from datetime import datetime


router = APIRouter()


# Hardcoded flights
FLIGHTS = [
    {
        "flight_id": uuid4(),
        "airline_id": uuid4(), # Foreign Key
        "origin_airport_id": uuid4(), # Foreign Key
        "destination_airport_id": uuid4(), # Foreign Key
        "scheduled_departure": datetime(2024, 1, 1, hour=0, minute=0, second=0),
        "scheduled_arrival": datetime(2024, 1, 1, hour=4, minute=20, second=0),
        "arrival_delay": 10,
        "status": "landed",
        "cancellation_reason": None,
        "air_system_delay": 1,
        "security_delay": 0,
        "airline_delay": 0,
        "late_aircraft_delay": 1,
        "weather_delay": 0
    }
]

@router.get("/", response_model=GetFlightsSchema)
async def get_flights():
    """
    """
    return {"flights": FLIGHTS}
