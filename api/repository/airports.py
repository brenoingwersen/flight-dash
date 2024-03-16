from models.airports import AirportModel
from typing import Optional, List, Dict
from uuid import UUID


class AirportsRepository:
    def __init__(self, session):
        self.session = session

    def _get(self, airport_id: UUID):
        return (self.session.query(AirportModel)
                .filter(AirportModel.airport_id == airport_id)
                .one()) # raises NotFoundError
    
    def get(self, airport_id: UUID, **filters) -> Dict:
        """
        Get an airport by its airport_id.
        """
        return self._get(airport_id)
    
    def list(self, limit: Optional[int]) -> List[Dict]:
        """
        List airports.
        """
        query = self.session.query(AirportModel)
        records = query.limit(limit).all()
        return [airport.dict() for airport in records]

    def create(self, payload: Dict) -> Dict:
        """
        Creates a new airport.
        """
        airport = AirportModel(**payload)
        self.session.add(airport)
        return airport.dict()
    
    def update(self, airport_id: UUID, payload: Dict) -> Dict:
        """
        Updates an airport.
        """
        airport = self._get(airport_id)
        for k, v in payload.items():
            setattr(airport, k, v)
        return airport.dict()
    
    def delete(self, airport_id: UUID) -> None:
        """
        Deletes a flight.
        """
        airport = self._get(airport_id)
        self.session.delete(airport)
