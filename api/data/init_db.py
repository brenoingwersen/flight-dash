import sys

sys.path.append("/home/user/flight-dash/api")


from typing import Generator, Iterable
from data_preprocessing import (flights_df,
                                airlines_df)
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Schemas
from schemas.flights import GetFlightSchema
from schemas.airlines import GetAirlineSchema

# Models
from models.flights import FlightModel
from models.airlines import AirlineModel
from models.base import Base


def get_batches(iterable: Iterable, 
                batch_size: int=100) -> Generator:
    """
    Generate batches of data.
    """
    for i in range(0, len(iterable), batch_size):
        yield iterable[i: i + batch_size]


def init_db():
    """
    Adds data to the tables.
    """
    # Pydantic validation
    valid_flight_data = [GetFlightSchema.model_validate(flight).model_dump() for flight in flights_df.to_dict(orient="records")]
    valid_airline_data = [GetAirlineSchema.model_validate(airline).model_dump() for airline in airlines_df.to_dict(orient="records")]

    # ORM
    flights = [FlightModel(**flight) for flight in valid_flight_data]
    airlines = [AirlineModel(**airline) for airline in valid_airline_data]

    # Flights
    for batch in get_batches(flights):
        with SessionLocal() as session:
            session.bulk_save_objects(batch)
            session.commit()
        session.close()

    # Airlines
    for batch in get_batches(airlines):
        with SessionLocal() as session:
            session.bulk_save_objects(batch)
            session.commit()
        session.close()


if __name__ == "__main__":
    engine = create_engine("sqlite:///../data.db")

    # Create all tables using the models
    Base.metadata.create_all(engine)
    # Reusable session maker
    SessionLocal = sessionmaker(bind=engine)
    
    # Initialize the database with the data
    init_db()
