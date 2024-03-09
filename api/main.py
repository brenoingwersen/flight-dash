from fastapi import FastAPI
from routes.flights import router as flights_router
from routes.airlines import router as airlines_router


# Instantiate the app
app = FastAPI()

# Add the routes
app.include_router(flights_router, prefix="/flights", tags=["flights"])
app.include_router(airlines_router, prefix="/airlines", tags=["airlines"])
