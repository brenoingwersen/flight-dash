from models.base import Base
from sqlalchemy import (Column,
                        Integer,
                        String,
                        ForeignKey,
                        DateTime,
                        Boolean,
                        Enum)
from sqlalchemy.dialects.postgresql import UUID
from typing import Dict
from uuid import uuid4
from schemas.flights import Status
from sqlalchemy.orm import relationship


class FlightModel(Base):
    __tablename__ = "flights"

    flight_id = Column(UUID(as_uuid=True), primary_key=True, default=uuid4)
    airline_id = Column(UUID(as_uuid=True), 
                        ForeignKey("airlines.airline_id"),
                        default=uuid4)
    origin_airport_id = Column(UUID(as_uuid=True),
                               ForeignKey("airports.airport_id"),
                               default=uuid4)
    destination_airport_id = Column(UUID(as_uuid=True),
                                    ForeignKey("airports.airport_id"),
                                    default=uuid4)
    distance = Column(Integer, nullable=False)
    scheduled_departure = Column(DateTime, nullable=False)
    scheduled_arrival = Column(DateTime, nullable=False)
    arrival_delay = Column(Integer, nullable=False, default=0)
    status = Column(Enum(Status), nullable=False)
    cancellation_reason = Column(String)
    air_system_delay = Column(Boolean, nullable=False)
    security_delay = Column(Boolean, nullable=False)
    airline_delay = Column(Boolean, nullable=False)
    late_aircraft_delay = Column(Boolean, nullable=False)
    weather_delay = Column(Boolean, nullable=False)

    airline = relationship("AirlineModel", back_populates="flights")
    origin_airport = relationship("AirportModel",
                                  foreign_keys=[origin_airport_id],
                                  back_populates="flights_as_origin")
    destination_airport = relationship("AirportModel",
                                       foreign_keys=[destination_airport_id],
                                       back_populates="flights_as_destination")

    def dict(self) -> Dict:
        """
        Returns a dictionay representation of a flight.
        """
        return {column.name: getattr(self, column.name) for column in self.__table__.columns}
