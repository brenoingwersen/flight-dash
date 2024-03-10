# Main
from fastapi import APIRouter, HTTPException
from starlette.responses import Response
from starlette import status
from fastapi import HTTPException
from repository.flights import FlightsRepository
from deps import SessionDep

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
async def get_flights(session: SessionDep, 
                      limit: Optional[int] = None) -> Dict[str, List]:
    """
    Endpoint to list all flights.
    """
    # Dependency injection
    flights_repo = FlightsRepository(session)
    flights = flights_repo.list(limit)
    return {"flights": flights}


@router.post("/",
             status_code=status.HTTP_201_CREATED,
             response_model=GetFlightSchema)
async def create_flight(session: SessionDep,
                        payload: CreateFlightSchema) -> Dict:
    """
    Endpoint to create a new flight.
    """
    # Validate the payload
    flight_payload = payload.model_dump()
    # Add a flight_id
    flight_payload.update({"flight_id": uuid4()})
    flight_repo = FlightsRepository(session)
    new_flight = flight_repo.create(flight_payload)
    session.commit()
    return new_flight


@router.get("/{flight_id}", response_model=GetFlightSchema)
async def get_flight(session: SessionDep, 
                     flight_id: UUID):
    """
    Endpoint to get a flight.
    """
    flights_repo = FlightsRepository(session)
    try:
        flight = flights_repo.get(flight_id)
        return flight
    except NoResultFound:
        raise HTTPException(status_code=404,
                            detail=f"Flight with ID {flight_id} not found.")


@router.put("/{flight_id}",
            status_code=status.HTTP_201_CREATED,
            response_model=GetFlightSchema)
async def update_flight(session: SessionDep, 
                        flight_id: UUID,
                        payload: CreateFlightSchema) -> Dict:
    """
    Endpoint for updating a flight.
    """
    flight_payload = payload.model_dump()
    flights_repo = FlightsRepository(session)
    try:
        flight = flights_repo.update(flight_id, flight_payload)
        session.commit() # Persists the changes to the db
        return flight
    except NoResultFound:
        raise HTTPException(status_code=404,
                            detail=f"Flight with ID {flight_id} not found.")


@router.delete("/{flight_id}",
               status_code=status.HTTP_204_NO_CONTENT,
               response_class=Response)
async def delete_flight(session: SessionDep, 
                        flight_id: UUID) -> Response:
    """
    Endpoint for deleting a flight.
    """
    flights_repo = FlightsRepository(session)
    try:    
        flights_repo.delete(flight_id)    
        session.commit() # Persists the changes to the db
        return Response(status_code=204)
    except NoResultFound:
        raise HTTPException(status_code=404,
                            detail=f"Flight with ID {flight_id} not found.")
