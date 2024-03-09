from models.airlines import AirlineModel
from typing import Optional, List, Dict
from sqlalchemy.orm import Session
from uuid import UUID

from loguru import logger
class AirlinesRepository:
    """
    Repository pattern to perform CRUD operations
    to the airlines table.
    """

    def __init__(self, session: Session):
        self.session = session

    def _get(self, airline_id: UUID) -> AirlineModel:
        """
        Return an airline from the db based
        on the provided id.
        """
        logger.info(f"STARTING SEACH USING TYPE: {type(airline_id)}")
        logger.info(f"STARTING SEACH USING: {airline_id}")
        return (self.session.query(AirlineModel)
                .filter(AirlineModel.airline_id == airline_id)
                .one())  # Raises NotFoundError

    def get(self, airline_id: UUID) -> Dict:
        """
        Return a Dict representation of an
        airline from the db.
        """
        return self._get(airline_id).dict()

    def create(self, payload: Dict) -> Dict:
        """
        Creates a new airline from the provided data.
        """
        airline = AirlineModel(**payload)
        self.session.add(airline)
        return airline.dict()

    def update(self,
               airline_id: UUID,
               payload: Dict) -> Dict:
        """
        Updates the information of an airline.
        """
        airline = self._get(airline_id)
        for k, v in payload.items():
            setattr(airline, k, v)
        return airline.dict()

    def delete(self, airline_id: UUID):
        """
        Deletes an airline.
        """
        self.session.delete(self._get(airline_id))

    def list(self, limit: Optional[int]) -> List[Dict]:
        """
        Returns multiple airlines from the database.
        """
        airlines = (self.session.query(AirlineModel)
                    .limit(limit)
                    .all())
        return [airline.dict() for airline in airlines]
