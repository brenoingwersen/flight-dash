from models.flights import FlightModel
from typing import Optional, List, Dict
from uuid import UUID


class FlightsRepository:
    def __init__(self, session):
        self.session = session

    def _get(self, flight_id: UUID, **filters):
        return (self.session.query(FlightModel)
                .filter(FlightModel.flight_id == flight_id)
                .one()) # raises NotFoundError
    
    def get(self, flight_id: UUID, **filters) -> Dict:
        """
        Get a flight by its flight_id.
        """
        return self._get(flight_id, **filters)
    
    def list(self, limit: Optional[int]) -> List[Dict]:
        """
        List flights.
        """
        query = self.session.query(FlightModel)
        records = query.limit(limit).all()
        return [flight.dict() for flight in records]

    def create(self, payload: Dict) -> Dict:
        """
        Creates a new flight.
        """
        flight = FlightModel(**payload)
        self.session.add(flight)
        return flight.dict()
    
    def update(self, flight_id: UUID, payload: Dict) -> Dict:
        """
        Updates a flight.
        """
        flight = self._get(flight_id)
        for k, v in payload.items():
            setattr(flight, k, v)
        return flight.dict()
    
    def delete(self, flight_id: UUID) -> None:
        """
        Deletes a flight.
        """
        flight = self._get(flight_id)
        self.session.delete(flight)
