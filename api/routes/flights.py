# Main
from fastapi import APIRouter, Depends
from starlette.requests import Request

# Schcmeas
from schemas.flights import GetFlightSchema, GetFlightsSchema, CreateFlightSchema

# Utils
from uuid import uuid4
from datetime import datetime
from loguru import logger


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
    Endpoint to list all flights.
    """
    return {"flights": FLIGHTS}


@router.post("/", response_model=GetFlightSchema)
async def create_flight(payload: CreateFlightSchema):
    """
    Endpoint to create a new flight.
    """
    flight = payload.model_dump()
    # Add an uuid to the flight
    flight.update({"flight_id": uuid4()})
    # Append to the flights list
    FLIGHTS.append(flight)
    return flight
