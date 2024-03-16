from fastapi import FastAPI
from core.config import settings
from routes.flights import router as flights_router
from routes.airlines import router as airlines_router
from routes.airports import router as airports_router


# Instantiate the app
app = FastAPI(title=settings.TITLE,
              summary=settings.SUMMARY,
              description=settings.DESCRIPTION, 
              version=settings.VERSION)

# Add the routes
app.include_router(flights_router, prefix="/flights", tags=["Flights"])
app.include_router(airlines_router, prefix="/airlines", tags=["Airlines"])
app.include_router(airports_router, prefix="/airports", tags=["Airports"])
