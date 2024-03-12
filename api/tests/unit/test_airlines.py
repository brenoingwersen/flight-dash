from uuid import UUID, uuid4
from datetime import datetime


def test_get_airlines(test_app, sample_airline_data):
    """
    Test GET airlines endpoint
    """
    response = test_app.get("/airlines/")
    assert response.status_code == 200

    airlines = response.json()["airlines"]
    assert UUID(airlines[0]["airline_id"]) == UUID(sample_airline_data["airline_id"])


def test_get_airline(test_app, sample_airline_data):
    """
    Test GET airline endpoint
    """
    airline_id = sample_airline_data["airline_id"]
    response = test_app.get(f"/airlines/{airline_id}")
    assert response.status_code == 200

    airline = response.json()
    assert UUID(airline["airline_id"]) == UUID(airline_id)


def test_get_airline_404(test_app, sample_airline_data):
    """
    Test GET airline endpoint for a airline that doesn't exist.
    """
    airline_id = uuid4() # Random uuid
    response = test_app.get(f"/airlines/{airline_id}")
    assert response.status_code == 404
    assert response.json()["detail"] == f"airline with ID {airline_id} not found."


def test_post_airline(test_app, sample_airline_data):
    """
    Test POST airline endpoint
    """
    airline_id = sample_airline_data.pop("airline_id")
    # Check POST request
    response = test_app.post("/airlines/",
                             json=sample_airline_data)
    assert response.status_code == 201

    # Get airline_id and search for it in the db
    new_airline_id = response.json()["airline_id"]
    response = test_app.get(f"/airlines/{new_airline_id}")
    # Check if status code
    # and airline added to the test.db
    assert response.status_code == 200
    assert UUID(response.json()["airline_id"]) == UUID(new_airline_id)


def test_delete_airline(test_app, sample_airline_data):
    """
    Test DELETE airline endpoint.
    """
    airline_id = sample_airline_data["airline_id"]
    response = test_app.delete(f"/airlines/{airline_id}")
    assert response.status_code == 204


def test_put_airline(test_app, sample_airline_data):
    """
    Test PUT airline endpoint.
    """
    airline_id = sample_airline_data.pop("airline_id")
    # Update any property
    sample_airline_data.update({"airline": "New Airline Name"})
    response = test_app.put(f"/airlines/{airline_id}",
                            json=sample_airline_data)
    assert response.status_code == 201
    assert response.json()["airline"] == "New Airline Name"


def test_put_airline_404(test_app, sample_airline_data):
    """
    Test PUT airline endpoint for a airline that doesn't exist.
    """
    # Change the valid airline_id for a random one
    airline_id = str(uuid4())
    sample_airline_data.update({"airline_id": airline_id})
    response = test_app.put(f"/airlines/{airline_id}",
                            json=sample_airline_data)
    assert response.status_code == 404
