from models.flights import FlightModel


class FlightsRepository:
    def __init__(self, session):
        self.session = session

    def _get(self, flight_id, **filters):
        return (self.session.query(FlightModel)
                .filter(FlightModel.flight_id == flight_id)
                .first())
    
    def get(self, flight_id: str, **filters):
        flight = self._get(flight_id, **filters)
        if flight is not None:
            return flight
