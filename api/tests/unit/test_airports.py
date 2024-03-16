from uuid import UUID, uuid4
from datetime import datetime


def test_get_airports(test_app, sample_airport_data):
    """
    Test GET airports endpoint
    """
    response = test_app.get("/airports/")
    assert response.status_code == 200

    airports = response.json()["airports"]
    assert UUID(airports[0]["airport_id"]) == UUID(sample_airport_data[0]["airport_id"])


def test_get_airport(test_app, sample_airport_data):
    """
    Test GET airport endpoint
    """
    airport_id = sample_airport_data[0]["airport_id"]
    response = test_app.get(f"/airports/{airport_id}")
    assert response.status_code == 200

    airport = response.json()
    assert UUID(airport["airport_id"]) == UUID(airport_id)


def test_get_airport_404(test_app):
    """
    Test GET airport endpoint for a airport that doesn't exist.
    """
    airport_id = uuid4() # Random uuid
    response = test_app.get(f"/airports/{airport_id}")
    assert response.status_code == 404
    assert response.json()["detail"] == f"Airport with ID {airport_id} not found."


def test_post_airport(test_app, sample_airport_data):
    """
    Test POST airport endpoint
    """
    sample_airport = sample_airport_data[0]
    airport_id = sample_airport.pop("airport_id")
    # Check POST request
    response = test_app.post("/airports/",
                             json=sample_airport)
    assert response.status_code == 201

    # Get airport_id and search for it in the db
    new_airport_id = response.json()["airport_id"]
    response = test_app.get(f"/airports/{new_airport_id}")
    # Check if status code
    # and airport added to the test.db
    assert response.status_code == 200
    assert UUID(response.json()["airport_id"]) == UUID(new_airport_id)


def test_delete_airport(test_app, sample_airport_data):
    """
    Test DELETE airport endpoint.
    """
    airport_id = sample_airport_data[0]["airport_id"]
    response = test_app.delete(f"/airports/{airport_id}")
    assert response.status_code == 204


def test_put_airport(test_app, sample_airport_data):
    """
    Test PUT airport endpoint.
    """
    sample_airport = sample_airport_data[0]
    airport_id = sample_airport.pop("airport_id")
    # Update any property
    sample_airport.update({"airport": "New airport Name"})
    response = test_app.put(f"/airports/{airport_id}",
                            json=sample_airport)
    assert response.status_code == 201
    assert response.json()["airport"] == "New airport Name"


def test_put_airport_404(test_app, sample_airport_data):
    """
    Test PUT airport endpoint for a airport that doesn't exist.
    """
    sample_airport = sample_airport_data[0]
    # Change the valid airport_id for a random one
    airport_id = str(uuid4())
    sample_airport.update({"airport_id": airport_id})
    response = test_app.put(f"/airports/{airport_id}",
                            json=sample_airport)
    assert response.status_code == 404
