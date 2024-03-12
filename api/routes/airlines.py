from fastapi import APIRouter
from starlette import status
from repository.airlines import AirlinesRepository
from sqlalchemy.exc import NoResultFound
from fastapi.exceptions import HTTPException
from fastapi import Response
from deps import SessionDep

# Schemas
from schemas.airlines import (CreateAirlineSchema,
                              GetAirlineSchema,
                              GetAirlinesSchema)

# Utils
from typing import Optional, Dict, List
from uuid import UUID, uuid4


router = APIRouter()


@router.get("/", response_model=GetAirlinesSchema)
async def get_airlines(session: SessionDep,
                       limit: int=10) -> Dict[str, List]:
    """
    GET endpoint for retrieving airlines.
    """
    airlines_repo = AirlinesRepository(session)
    airlines = airlines_repo.list(limit)
    return {"airlines": airlines}


@router.post("/",
             status_code=status.HTTP_201_CREATED,
             response_model=GetAirlineSchema)
async def post_airline(session: SessionDep,
                       payload: CreateAirlineSchema) -> Dict:
    """
    POST endpoint for creating a new airline.
    """
    # Convert to dict
    airline_payload = payload.model_dump()
    # Create a new id and add to tb
    airline_payload.update({"airline_id": uuid4()})
    airlines_repo = AirlinesRepository(session)
    new_airline = airlines_repo.create(airline_payload)
    session.commit()
    return new_airline


@router.get("/{airline_id}", response_model=GetAirlineSchema)
async def get_airline(session: SessionDep,
                      airline_id: UUID) -> Dict:
    """
    GET endpoint for retrieving an airline.
    """
    airlines_repo = AirlinesRepository(session)
    try:
        airline = airlines_repo.get(airline_id)
        return airline
    except NoResultFound:
        raise HTTPException(status_code=404,
                            detail=f"airline with ID {airline_id} not found.")


@router.put("/{airline_id}",
            status_code=status.HTTP_201_CREATED,
            response_model=GetAirlineSchema)
async def update_airline(session: SessionDep,
                         airline_id: UUID,
                         payload: CreateAirlineSchema) -> Dict:
    """
    PUT endpoint for updating an airline.
    """
    airline_payload = payload.model_dump()
    airlines_repo = AirlinesRepository(session)
    try:
            
        updated_airline = airlines_repo.update(airline_id=airline_id,
                                               payload=airline_payload)
        session.commit()
        return updated_airline
    except NoResultFound:
        raise HTTPException(status_code=404,
                            detail=f"airline with id {airline_id} not found.")


@router.delete("/{airline_id}",
               status_code=status.HTTP_204_NO_CONTENT,
               response_class=Response)
async def delete_airline(session: SessionDep,
                         airline_id: UUID) -> Response:
    """
    DELETE endpoint for deleting an airline.
    """
    airlines_repo = AirlinesRepository(session)
    try:
        airlines_repo.delete(airline_id)
        session.commit()
        return Response(status_code=204)
    except NoResultFound:
        raise HTTPException(status_code=404,
                            detail=f"airline with id {airline_id} not found.")
