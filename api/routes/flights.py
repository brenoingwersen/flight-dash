from fastapi import APIRouter, Depends


router = APIRouter()

@router.get("/")
async def get_flights():
    """
    """
    return [{"id": 1, 
            "date": "2024-01-01",
            "scheduled_departure": "00:00",
            "scheduled_arrival": "03:00",
            "arrival_delay": 10,
            "status": "landed"}]
