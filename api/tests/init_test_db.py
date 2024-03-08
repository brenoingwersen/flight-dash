from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from models.flights import FlightModel
from uuid import UUID
from datetime import datetime


def init_test_db(db_url: str):
    engine = create_engine(db_url, echo=True)
    FlightModel.metadata.create_all(bind=engine)

    SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
    session = SessionLocal()

    # Inserting sample data
    sample_flight_data = [
        {
            "flight_id": UUID("b0b697b5-f8c8-4901-9812-b1092bbb8881"),
            "airline_id": UUID("0a182982-e0ec-44d2-9c8a-fdb01c7a878c"),
            "origin_airport_id": UUID("2ca1504e-03bc-489d-a371-28861ce1769f"),
            "destination_airport_id": UUID("91a587e1-58f1-4281-ba34-5270f66db0ca"),
            "distance": 0,
            "scheduled_departure": datetime(2024, 1, 1, hour=0, minute=0, second=0),
            "scheduled_arrival": datetime(2024, 1, 1, hour=4, minute=20, second=0),
            "arrival_delay": 10,
            "status": "landed",
            "cancellation_reason": None,
            "air_system_delay": 1,
            "security_delay": 0,
            "airline_delay": 0,
            "late_aircraft_delay": 1,
            "weather_delay": 0
        }
    ]
    flights = [FlightModel(**flight) for flight in sample_flight_data]
    session.bulk_save_objects(flights)
    session.commit()
    session.close()

if __name__ == "__main__":
    init_test_db("sqlite:///./test.db")