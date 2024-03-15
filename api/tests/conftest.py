import os
import sys
sys.path.append(os.path.dirname(os.path.dirname(__file__)))


import pytest
from sqlalchemy.pool import NullPool
from sqlalchemy.orm import sessionmaker, Session
from sqlalchemy import create_engine
from starlette.testclient import TestClient
from tests.init_test_db import init_test_db
from typing import Dict, Generator, List


# App
from main import app
from deps import get_db

# db session maker
SQLALCHEMY_TEST_DB_URI = "sqlite:///./test.db"
engine = create_engine(SQLALCHEMY_TEST_DB_URI, poolclass=NullPool)
SessionLocal = sessionmaker(bind=engine)


def get_test_db() -> Generator[Session, None, None]:
    """
    Dependency for generating sessions.
    """
    session = SessionLocal()

    try:
        yield session
    except:
        # If any exceptions then rollback
        session.rollback()
        raise
    finally:
        # Always close the session
        session.close()


# Inject engine dependency
app.dependency_overrides[get_db] = get_test_db


@pytest.fixture(scope="function")
def sample_flight_data() -> Dict:
    """
    Returns a sample flight.
    """
    return {
        "flight_id": "b0b697b5-f8c8-4901-9812-b1092bbb8881",
        "airline_id": "0a182982-e0ec-44d2-9c8a-fdb01c7a878c",
        "origin_airport_id": "2ca1504e-03bc-489d-a371-28861ce1769f",
        "destination_airport_id": "91a587e1-58f1-4281-ba34-5270f66db0ca",
        "distance": 0,
        "scheduled_departure": "2024-01-01T00:00:00.0Z",
        "scheduled_arrival": "2024-01-01T03:00:00.0Z",
        "arrival_delay": 0,
        "status": "landed",
        "cancellation_reason": "A",
        "air_system_delay": True,
        "security_delay": False,
        "airline_delay": False,
        "late_aircraft_delay": True,
        "weather_delay": False
    }


@pytest.fixture(scope="function")
def sample_airline_data() -> Dict:
    """
    Returns a sample airline.
    """
    return {
        "airline_id": "0a182982-e0ec-44d2-9c8a-fdb01c7a878c",
        "iata_code": "AA",
        "airline": "Test Airline Co."
    }


@pytest.fixture(scope="function")
def sample_airport_data() -> List[Dict]:
    """
    Returns a sample data for the airports model.
    """
    return [
        {
            "airport_id": "2ca1504e-03bc-489d-a371-28861ce1769f",
            "iata_code": "TST",
            "airport": "Origin test airport",
            "city": "Test city",
            "state": "Test state",
            "country": "Test country",
            "latitude": 12.345678,
            "longitude": -12.345678
        },
        {
            "airport_id": "91a587e1-58f1-4281-ba34-5270f66db0ca",
            "iata_code": "TST",
            "airport": "Destination test airport",
            "city": "Test city",
            "state": "Test state",
            "country": "Test country",
            "latitude": 12.345678,
            "longitude": -12.345678
        }
    ]


@pytest.fixture(scope="function")
def test_db(sample_flight_data,
            sample_airline_data, 
            sample_airport_data):
    init_test_db(SQLALCHEMY_TEST_DB_URI,
                 [sample_flight_data],
                 [sample_airline_data],
                 sample_airport_data)

    yield

    # Drop the database after the test function completes
    os.remove("./test.db")


@pytest.fixture(scope="function")  # Run for every .py
def test_app(test_db):
    """
    Set up the testing environment
    """
    client = TestClient(app)
    yield client
