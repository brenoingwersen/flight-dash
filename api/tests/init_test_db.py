from typing import Dict, List
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Models
from models.flights import FlightModel
from models.airlines import AirlineModel
from models.base import Base

# Schemas
from schemas.flights import GetFlightSchema
from schemas.airlines import GetAirlineSchema


def init_test_db(db_url: str,
                 sample_flight_data: List[Dict],
                 sample_airline_data: List[Dict]):
    """
    Creates a test database with the provided data.
    """
    engine = create_engine(db_url, echo=True)

    # Create tables
    Base.metadata.create_all(bind=engine)

    SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
    session = SessionLocal()

    # Validate the data
    valid_flight_data = [GetFlightSchema.model_validate(flight).model_dump() for flight in sample_flight_data]
    valid_airline_data = [GetAirlineSchema.model_validate(airline).model_dump() for airline in sample_airline_data]

    # Inserting sample data
    flights = [FlightModel(**flight) for flight in valid_flight_data]
    airlines = [AirlineModel(**airline) for airline in valid_airline_data]
    session.bulk_save_objects(flights)
    session.bulk_save_objects(airlines)
    session.commit()
    session.close()


if __name__ == "__main__":
    init_test_db("sqlite:///./test.db")
