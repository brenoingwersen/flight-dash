# Main
from fastapi import APIRouter, Depends, HTTPException
from starlette.requests import Request
from starlette.responses import Response
from starlette import status
from fastapi import HTTPException
from repository.flights import FlightsRepository
from repository.unit_of_work import UnitOfWork

# Schcmeas
from schemas.flights import (GetFlightSchema,
                             GetFlightsSchema,
                             CreateFlightSchema)

# Utils
from uuid import UUID, uuid4
from typing import Optional, List, Dict
from sqlalchemy.exc import NoResultFound


router = APIRouter()

@router.get("/", response_model=GetFlightsSchema)
async def get_flights(limit: Optional[int] = None) -> Dict[str, List]:
    """
    Endpoint to list all flights.
    """
    with UnitOfWork() as unit_of_work:
        # Dependency injection
        flights_repo = FlightsRepository(unit_of_work.session)
        flights = flights_repo.list(limit)
    return {"flights": flights}


@router.post("/",
             status_code=status.HTTP_201_CREATED,
             response_model=GetFlightSchema)
async def create_flight(payload: CreateFlightSchema) -> Dict:
    """
    Endpoint to create a new flight.
    """
    # Validate the payload
    flight_payload = payload.model_dump()
    # Add a flight_id
    flight_payload.update({"flight_id": uuid4()})
    with UnitOfWork() as unit_of_work:
        flight_repo = FlightsRepository(unit_of_work.session)
        new_flight = flight_repo.create(flight_payload)
        unit_of_work.commit()
    return new_flight


@router.get("/{flight_id}", response_model=GetFlightSchema)
async def get_flight(flight_id: UUID):
    """
    Endpoint to get a flight.
    """
    try:
        with UnitOfWork() as unit_of_work:
            flights_repo = FlightsRepository(unit_of_work.session)
            flight = flights_repo.get(flight_id)
        return flight
    except NoResultFound:
        raise HTTPException(status_code=404,
                            detail=f"Flight with ID {flight_id} not found.")


@router.put("/{flight_id}",
            status_code=status.HTTP_201_CREATED,
            response_model=GetFlightSchema)
async def update_flight(flight_id: UUID,
                        payload: CreateFlightSchema) -> Dict:
    """
    Endpoint for updating a flight.
    """
    flight_payload = payload.model_dump()
    try:
        with UnitOfWork() as unit_of_work:
            flights_repo = FlightsRepository(unit_of_work.session)
            flight = flights_repo.update(flight_id, flight_payload)
            unit_of_work.commit() # Persists the changes to the db
        return flight
    except NoResultFound:
        raise HTTPException(status_code=404,
                            detail=f"Flight with ID {flight_id} not found.")


@router.delete("/{flight_id}",
               status_code=status.HTTP_204_NO_CONTENT,
               response_class=Response)
async def delete_flight(flight_id: UUID) -> Response:
    """
    Endpoint for deleting a flight.
    """
    try:
        with UnitOfWork() as unit_of_work:
            flights_repo = FlightsRepository(unit_of_work.session)
            flights_repo.delete(flight_id)    
            unit_of_work.commit() # Persists the changes to the db
        return Response(status_code=204)
    except NoResultFound:
        raise HTTPException(status_code=404,
                            detail=f"Flight with ID {flight_id} not found.")
