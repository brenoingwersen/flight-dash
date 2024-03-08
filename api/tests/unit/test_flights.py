from uuid import UUID, uuid4
from datetime import datetime


def test_get_flights(test_app, sample_flight_data):
    """
    Test GET flights endpoint
    """
    response = test_app.get("/flights/")
    assert response.status_code == 200

    flights = response.json()["flights"]
    assert UUID(flights[0]["flight_id"]) == UUID(
        sample_flight_data["flight_id"])


def test_get_flight(test_app, sample_flight_data):
    """
    Test GET flight endpoint
    """
    flight_id = sample_flight_data["flight_id"]
    response = test_app.get(f"/flights/{flight_id}")
    assert response.status_code == 200

    flight = response.json()
    assert UUID(flight["flight_id"]) == UUID(flight_id)


def test_get_flight_404(test_app, sample_flight_data):
    """
    Test GET flight endpoint for a flight that doesn't exist.
    """
    flight_id = uuid4() # Random uuid
    response = test_app.get(f"/flights/{flight_id}")
    assert response.status_code == 404
    assert response.json()["detail"] == f"Flight with ID {flight_id} not found."


def test_post_flight(test_app, sample_flight_data):
    """
    Test POST flight endpoint
    """
    flight_id = sample_flight_data.pop("flight_id")
    # Check POST request
    response = test_app.post("/flights/",
                             json=sample_flight_data)
    assert response.status_code == 201

    # Get flight_id and search for it in the db
    new_flight_id = response.json()["flight_id"]
    response = test_app.get(f"/flights/{new_flight_id}")
    # Check if status code
    # and flight added to the test.db
    assert response.status_code == 200
    assert UUID(response.json()["flight_id"]) == UUID(new_flight_id)


def test_delete_flight(test_app, sample_flight_data):
    """
    Test DELETE flight endpoint.
    """
    flight_id = sample_flight_data["flight_id"]
    response = test_app.delete(f"/flights/{flight_id}")
    assert response.status_code == 204


def test_put_flight(test_app, sample_flight_data):
    """
    Test PUT flight endpoint.
    """
    flight_id = sample_flight_data.pop("flight_id")
    # Update any property
    sample_flight_data.update({"distance": 1})
    response = test_app.put(f"/flights/{flight_id}",
                            json=sample_flight_data)
    assert response.status_code == 201
    assert response.json()["distance"] == 1


def test_put_flight_404(test_app, sample_flight_data):
    """
    Test PUT flight endpoint for a flight that doesn't exist.
    """
    # Change the valid flight_id for a random one
    flight_id = str(uuid4())
    sample_flight_data.update({"flight_id": flight_id})
    response = test_app.put(f"/flights/{flight_id}",
                            json=sample_flight_data)
    assert response.status_code == 404
