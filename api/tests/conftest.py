import pytest
from starlette.testclient import TestClient

# App
from main import app

# Utils
from uuid import UUID
from datetime import datetime


@pytest.fixture(scope="module")  # Run for every .py
def test_app():
    """
    Set up the testing environment
    """
    client = TestClient(app)
    yield client


@pytest.fixture
def sample_flight_data():
    """
    Provides a testing flight data
    """
    return {
        "flight_id": UUID("b0b697b5-f8c8-4901-9812-b1092bbb8881"),
        "airline_id": UUID("0a182982-e0ec-44d2-9c8a-fdb01c7a878c"),
        "origin_airport_id": UUID("2ca1504e-03bc-489d-a371-28861ce1769f"),
        "destination_airport_id": UUID("91a587e1-58f1-4281-ba34-5270f66db0ca"),
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
