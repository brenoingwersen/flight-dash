import os
import sys
sys.path.append(os.path.dirname(os.path.dirname(__file__)))


from typing import Generator, Iterable
from data_preprocessing import (flights_df,
                                airlines_df, 
                                airports_df)
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy_utils import database_exists, create_database

# Schemas
from schemas.flights import GetFlightSchema
from schemas.airlines import GetAirlineSchema
from schemas.airports import GetAirportSchema

# Models
from models.flights import FlightModel
from models.airlines import AirlineModel
from models.airports import AirportModel
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
    valid_airport_data = [GetAirportSchema.model_validate(airport).model_dump() for airport in airports_df.to_dict(orient="records")]

    # ORM
    flights = [FlightModel(**flight) for flight in valid_flight_data]
    airlines = [AirlineModel(**airline) for airline in valid_airline_data]
    airports = [AirportModel(**airport) for airport in valid_airport_data]

    # Airlines
    for batch in get_batches(airlines):
        with SessionLocal() as session:
            session.bulk_save_objects(batch)
            session.commit()

    # Airports
    for batch in get_batches(airports):
        with SessionLocal() as session:
            session.bulk_save_objects(batch)
            session.commit()

    # Flights
    # Populate flights table lastly
    # since a flight needs to have an airline and airport
    # already present in the db
    for batch in get_batches(flights):
        with SessionLocal() as session:
            session.bulk_save_objects(batch)
            session.commit()


if __name__ == "__main__":
    import argparse
    # Fetching the connection string for the database
    from core.config import settings


    # Infering database type from arguments
    # Overrides the DATABASE_TYPE environment variable
    parser = argparse.ArgumentParser()
    parser.add_argument("--db-type",
                      default=None,
                      choices=["sqlite", "postgresql"],
                      dest="DATABASE_TYPE")
    args = parser.parse_args()
    DATABASE_TYPE = args.DATABASE_TYPE

    if DATABASE_TYPE == "sqlite":
        connect_string = settings.SQLITE_DATABASE_URI
        db_type = "sqlite"
    elif DATABASE_TYPE == "sqlite":
        connect_string = settings.POSTGRES_DATABASE_URI
        db_type = "postgresql"
    else:
        connect_string = settings.SQLALCHEMY_DATABASE_URI
        db_type = settings.DATABASE_TYPE

    if not database_exists(connect_string):
        print(f"Creating a {db_type} database")
        create_database(connect_string)
        print("Database created!")
    
        engine = create_engine(connect_string)

        # Create all tables using the models
        Base.metadata.create_all(engine)
        # Reusable session maker
        SessionLocal = sessionmaker(bind=engine)
        
        # Initialize the database with the data
        init_db()
        print("Database populated!")
    else:
        print("Database already exists.")
