from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, ForeignKey, DateTime, Boolean
from utils import generate_uuid
from typing import Dict


Base = declarative_base()

class FlightModel(Base):
    __tablename__ = "flights"

    flight_id = Column(String, primary_key=True, default=generate_uuid)
    airline_id = Column(String, default=generate_uuid)
    origin_airport_id = Column(String, default=generate_uuid)
    destination_airport_id = Column(String, default=generate_uuid)
    distance = Column(Integer, nullable=False)
    scheduled_departure = Column(DateTime, nullable=False)
    scheduled_arrival = Column(DateTime, nullable=False)
    arrival_delay = Column(Integer, nullable=False, default=0)
    status = Column(String, nullable=False)
    cancellation_reason = Column(String)
    air_system_delay = Column(Boolean, nullable=False)
    security_delay = Column(Boolean, nullable=False)
    airline_delay = Column(Boolean, nullable=False)
    late_aircraft_delay = Column(Boolean, nullable=False)
    weather_delay = Column(Boolean, nullable=False)

    def dict(self) -> Dict:
        """
        Returns a dictionay representation of a flight.
        """
        return {column.name: getattr(self, column.name) for column in self.__table__.columns}