from pydantic_settings import BaseSettings


class Settings(BaseSettings):
    TITLE: str = "Flights API"
    SUMMARY: str = "An API for managing flight data."
    DESCRIPTION: str = "This API allows users to access and manage flight data,\
        including flight schedules, list flights per airport and airline and check cancellations."
    VERSION: str = "0.1.0"

    SQLALCHEMY_DATABASE_URI: str = "sqlite:///./data.db"


settings = Settings()
