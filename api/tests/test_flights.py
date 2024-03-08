from uuid import UUID
from datetime import datetime


def test_get_flights(test_app):
    """
    Test GET flights endpoint
    """
    response = test_app.get("/flights/")
    assert response.status_code == 200

    flights = response.json()["flights"]
    assert UUID(flights[0]["flight_id"]) == UUID("b0b697b5-f8c8-4901-9812-b1092bbb8881")


def test_get_flight(test_app):
    """
    Test GET flight endpoint
    """
    flight_id = "b0b697b5-f8c8-4901-9812-b1092bbb8881"
    response = test_app.get(f"/flights/{flight_id}")
    assert response.status_code == 200

    flight = response.json()
    assert UUID(flight["flight_id"]) == UUID(flight_id)


def test_post_flight(test_app):
    """
    Test POST flight endpoint
    """
    flight_data = {
            "airline_id": "0a182982-e0ec-44d2-9c8a-fdb01c7a878c",
            "origin_airport_id": "2ca1504e-03bc-489d-a371-28861ce1769f",
            "destination_airport_id": "91a587e1-58f1-4281-ba34-5270f66db0ca",
            "distance": 0,
            "scheduled_departure": "2024-03-07T21:09:35.203Z",
            "scheduled_arrival": "2024-03-07T21:09:35.203Z",
            "arrival_delay": 10,
            "status": "landed",
            "cancellation_reason": "String",
            "air_system_delay": True,
            "security_delay": False,
            "airline_delay": False,
            "late_aircraft_delay": True,
            "weather_delay": False
    }
    # Check POST request
    response = test_app.post("/flights/", json=flight_data)
    assert response.status_code == 201
    
    # Get flight_id and search for it in the db
    flight_id = response.json()["flight_id"]
    response = test_app.get(f"/flights/{flight_id}")
    # Check if status code 
    # and flight added to the test.db
    assert response.status_code == 200
    assert UUID(response.json()["flight_id"]) == UUID(flight_id)


def test_delete_flight(test_app):
    """
    Test DELETE flight endpoint.
    """
    flight_id = "b0b697b5-f8c8-4901-9812-b1092bbb8881"
    response = test_app.delete(f"/flights/{flight_id}")
    assert response.status_code == 204


def test_put_flight(test_app):
    """
    Test PUT flight endpoint.
    """
    flight_id = "b0b697b5-f8c8-4901-9812-b1092bbb8881"
    flight_data = {
            "airline_id": "0a182982-e0ec-44d2-9c8a-fdb01c7a878c",
            "origin_airport_id": "2ca1504e-03bc-489d-a371-28861ce1769f",
            "destination_airport_id": "91a587e1-58f1-4281-ba34-5270f66db0ca",
            "distance": 1,
            "scheduled_departure": "2024-03-07T21:09:35.203Z",
            "scheduled_arrival": "2024-03-07T21:09:35.203Z",
            "arrival_delay": 10,
            "status": "landed",
            "cancellation_reason": "String",
            "air_system_delay": True,
            "security_delay": False,
            "airline_delay": False,
            "late_aircraft_delay": True,
            "weather_delay": False
    }
    response = test_app.put(f"/flights/{flight_id}", 
                               json=flight_data)
    assert response.status_code == 201
    assert response.json()["distance"] == 1