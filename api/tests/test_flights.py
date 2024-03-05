def test_get_flights(test_app, sample_flight_data):
    """
    Test GET flights endpoint
    """
    response = test_app.get("/flights/")
    assert response.status_code == 200
    # assert response.json()["flights"] == [sample_flight_data]
