from fastapi import FastAPI
from routes.flights import router as flights_router


# Instantiate the app
app = FastAPI()

# Add the routes
app.include_router(flights_router, prefix="/flights")