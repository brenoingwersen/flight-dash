from models.base import Base
from sqlalchemy import (Column,
                        String,
                        ForeignKey)
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.postgresql import UUID
from typing import Dict
from uuid import uuid4


class AirlineModel(Base):
    __tablename__ = "airlines"

    airline_id = Column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    iata_code = Column(String, nullable=False)
    airline = Column(String, nullable=False)

    flights = relationship("FlightModel",
                           back_populates="airline")

    def dict(self) -> Dict:
        """
        Returns a dictionay representation of an airline.
        """
        return {column.name: getattr(self, column.name) for column in self.__table__.columns}
