from typing import Dict, List
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Models
from models.flights import FlightModel
from models.airlines import AirlineModel
from models.airports import AirportModel
from models.base import Base

# Schemas
from schemas.flights import GetFlightSchema
from schemas.airlines import GetAirlineSchema
from schemas.airports import GetAirportSchema


def init_test_db(db_url: str,
                 sample_flight_data: List[Dict],
                 sample_airline_data: List[Dict], 
                 sample_airport_data: List[Dict]):
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
    valid_airport_data = [GetAirportSchema.model_validate(airport).model_dump() for airport in sample_airport_data]

    # Inserting sample data
    flights = [FlightModel(**flight) for flight in valid_flight_data]
    airlines = [AirlineModel(**airline) for airline in valid_airline_data]
    airports = [AirportModel(**airport) for airport in valid_airport_data]

    session.bulk_save_objects(flights)
    session.bulk_save_objects(airlines)
    session.bulk_save_objects(airports)
    session.commit()
    session.close()


if __name__ == "__main__":
    init_test_db("sqlite:///./test.db")
