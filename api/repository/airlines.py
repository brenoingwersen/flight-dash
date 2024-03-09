from models.airlines import AirlineModel
from typing import Optional, List, Dict
from uuid import UUID


class AirlinesRepository:
    def __init__(self, session):
        self.session = session

    def _get(self, airline_id: UUID, **filters):
        return (self.session.query(AirlineModel)
                .filter(AirlineModel.airline_id == airline_id)
                .one()) # raises NotFoundError
    
    def get(self, airline_id: UUID, **filters) -> Dict:
        """
        Get a airline by its airline_id.
        """
        return self._get(airline_id, **filters)
    
    def list(self, limit: Optional[int]) -> List[Dict]:
        """
        List airlines.
        """
        query = self.session.query(AirlineModel)
        records = query.limit(limit).all()
        return [airline.dict() for airline in records]

    def create(self, payload: Dict) -> Dict:
        """
        Creates a new airline.
        """
        airline = AirlineModel(**payload)
        self.session.add(airline)
        return airline.dict()
    
    def update(self, airline_id: UUID, payload: Dict) -> Dict:
        """
        Updates an airline.
        """
        airline = self._get(airline_id)
        for k, v in payload.items():
            setattr(airline, k, v)
        return airline.dict()
    
    def delete(self, airline_id: UUID) -> None:
        """
        Deletes an airline.
        """
        airline = self._get(airline_id)
        self.session.delete(airline)
