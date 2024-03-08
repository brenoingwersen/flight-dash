from typing import Dict
import os
os.environ["TEST_MODE"] = "True"
os.environ["DATABASE_URL"] = "sqlite:///./test.db"

import pytest
from tests.init_test_db import init_test_db
from starlette.testclient import TestClient
from loguru import logger

# App
from main import app

# Utils
from uuid import UUID
from datetime import datetime


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
def test_db(sample_flight_data):
    db_url = os.getenv("DATABASE_URL")
    init_test_db(db_url, [sample_flight_data])

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
