from typing import Dict, List
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Models
from models.flights import FlightModel

# Schemas
from schemas.flights import GetFlightSchema

# Utils
from uuid import UUID
from datetime import datetime



def init_test_db(db_url: str,
                 sample_flight_data: List[Dict]):
    """
    Creates a test database with the provided data.
    """
    if not isinstance(sample_flight_data, list):
        raise TypeError("sample_flight_data must be a list")
    engine = create_engine(db_url, echo=True)

    FlightModel.metadata.create_all(bind=engine)

    SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
    session = SessionLocal()

    # Validate the data
    valid_flight_data = [GetFlightSchema.model_validate(flight).model_dump() for flight in sample_flight_data]

    # Inserting sample data
    flights = [FlightModel(**flight) for flight in valid_flight_data]
    session.bulk_save_objects(flights)
    session.commit()
    session.close()


if __name__ == "__main__":
    init_test_db("sqlite:///./test.db")
