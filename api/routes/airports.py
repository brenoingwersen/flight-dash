# Main
from fastapi import APIRouter, HTTPException
from starlette.responses import Response
from starlette import status
from fastapi import HTTPException
from repository.airports import AirportsRepository
from deps import SessionDep

# Schcmeas
from schemas.airports import (GetAirportSchema,
                              GetAirportsSchema,
                              CreateAirportSchema)

# Utils
from uuid import UUID, uuid4
from typing import Optional, List, Dict
from sqlalchemy.exc import NoResultFound


router = APIRouter()


@router.get("/", response_model=GetAirportsSchema)
async def get_airports(session: SessionDep, limit: int=10) -> Dict[str, List]:
    """
    GET endpoint for retrieving airports.
    """
    repo = AirportsRepository(session)
    return {"airports": repo.list(limit)}


@router.post("/",
             status_code=status.HTTP_201_CREATED,
             response_model=GetAirportSchema)
async def create_flight(session: SessionDep,
                        payload: CreateAirportSchema) -> Dict:
    """
    Endpoint to create a new flight.
    """
    # Validate the payload
    airport_payload = payload.model_dump()
    # Add a flight_id
    airport_payload.update({"airport_id": uuid4()})
    repo = AirportsRepository(session)
    new_airport = repo.create(airport_payload)
    session.commit()
    return new_airport


@router.get("/{airport_id}", response_model=GetAirportSchema)
async def get_flight(session: SessionDep,
                     airport_id: UUID):
    """
    Endpoint to get an airport.
    """
    repo = AirportsRepository(session)
    try:
        airport = repo.get(airport_id)
        return airport
    except NoResultFound:
        raise HTTPException(status_code=404,
                            detail=f"Airport with ID {airport_id} not found.")


@router.put("/{airport_id}",
            status_code=status.HTTP_201_CREATED,
            response_model=GetAirportSchema)
async def update_flight(session: SessionDep,
                        airport_id: UUID,
                        payload: CreateAirportSchema) -> Dict:
    """
    Endpoint for updating an airport.
    """
    airport_payload = payload.model_dump()
    repo = AirportsRepository(session)
    try:
        airport = repo.update(airport_id, airport_payload)
        session.commit()  # Persists the changes to the db
        return airport
    except NoResultFound:
        raise HTTPException(status_code=404,
                            detail=f"Airport with ID {airport_id} not found.")


@router.delete("/{airport_id}",
               status_code=status.HTTP_204_NO_CONTENT,
               response_class=Response)
async def delete_flight(session: SessionDep,
                        airport_id: UUID) -> Response:
    """
    Endpoint for deleting a flight.
    """
    repo = AirportsRepository(session)
    try:
        repo.delete(airport_id)
        session.commit()  # Persists the changes to the db
        return Response(status_code=204)
    except NoResultFound:
        raise HTTPException(status_code=404,
                            detail=f"Airport with ID {airport_id} not found.")
