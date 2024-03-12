from models.base import Base
from models.flights import FlightModel
from sqlalchemy import (Column,
                        String,
                        Float,
                        ForeignKey)
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.postgresql import UUID
from typing import Dict
from uuid import uuid4


class AirportModel(Base):
    __tablename__ = "airports"

    airport_id = Column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    iata_code = Column(String, nullable=False)
    airport = Column(String, nullable=False)
    city = Column(String, nullable=False)
    state = Column(String, nullable=False)
    country = Column(String, nullable=False)
    latitude = Column(Float, nullable=False)
    longitude = Column(Float, nullable=False)

    flights_as_origin = relationship("FlightModel",
                                     foreign_keys=[FlightModel.origin_airport_id],
                                     back_populates="origin_airport")
    flights_as_destination = relationship("FlightModel",
                                          foreign_keys=[FlightModel.destination_airport_id],
                                          back_populates="destination_airport")

    def dict(self) -> Dict:
        """
        Returns a dictionay representation of an airline.
        """
        return {column.name: getattr(self, column.name) for column in self.__table__.columns}
