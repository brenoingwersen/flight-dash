from fastapi import APIRouter
from starlette import status
from repository.unit_of_work import UnitOfWork
from repository.airlines import AirlinesRepository

# Schemas
from schemas.airlines import (CreateAirlineSchema,
                              GetAirlineSchema,
                              GetAirlinesSchema)

# Utils
from typing import Optional, Dict, List
from uuid import UUID, uuid4


router = APIRouter()


@router.get("/", response_model=GetAirlinesSchema)
async def get_airlines(limit: Optional[int]) -> Dict[str, List]:
    """
    GET endpoint for retrieving airlines.
    """
    with UnitOfWork() as unit_of_work:
        airlines_repo = AirlinesRepository(unit_of_work.session)
        airlines = airlines_repo.list(limit)
    return {"airlines": airlines}

@router.post("/", 
             status_code=status.HTTP_201_CREATED,
             response_model=GetAirlineSchema)
async def post_airline(payload: CreateAirlineSchema) -> Dict:
    """
    POST endpoint for creating a new airline.
    """
    # Convert to dict
    airline_payload = payload.model_dump()
    # Create a new id and add to tb
    airline_payload.update({"airline_id": uuid4()})
    with UnitOfWork() as unit_of_work:
        airlines_repo = AirlinesRepository(unit_of_work.session)
        new_airline = airlines_repo.create(airline_payload)
        unit_of_work.commit()
    return new_airline


@router.put("/{airline_id}", 
            status_code=status.HTTP_201_CREATED,
            response_model=GetAirlineSchema)
async def update_airline(airline_id: UUID, 
                   payload: CreateAirlineSchema) -> Dict:
    """
    PUT endpoint for updating an airline.
    """
    airline_payload = payload.model_dump()    
    with UnitOfWork() as unit_of_work:
        airlines_repo = AirlinesRepository(unit_of_work.session)
        updated_airline = airlines_repo.update(airline_id=airline_id, 
                                               payload=airline_payload)
        unit_of_work.commit()
    return updated_airline
