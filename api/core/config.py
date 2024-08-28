from pydantic import Field, computed_field
from pydantic_settings import BaseSettings, SettingsConfigDict
from pydantic import PostgresDsn
from pydantic_core import MultiHostUrl


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_file=".env",
                                      env_ignore_empty=True)

    API_VERSION: str = "0.1.0"
    TITLE: str = "Flights API"
    SUMMARY: str = "An API for managing flight data."
    DESCRIPTION: str = "This API allows users to access and manage flight data,\
        including flight schedules, list flights per airport and airline and check cancellations."

    # PostgreSQL connection string
    POSTGRES_USER: str = Field("postgres", env="POSTGRES_USER")
    POSTGRES_PASSWORD: str = Field("user", env="POSTGRES_PASSWORD")
    POSTGRES_HOST: str = Field("172.17.0.1", env="POSTGRES_HOST") # Default local Docker host
    POSTGRES_PORT: int = Field("5432", env="POSTGRES_PORT")
    POSTGRES_DB: str = Field("flight-delays", env="POSTGRES_DB")
    
    @computed_field
    def POSTGRES_DATABASE_URI(self) -> str:
        """
        Returns a PostgreSQL connection string.
        """
        return MultiHostUrl.build(
            scheme="postgresql+psycopg",
            username=self.POSTGRES_USER,
            password=self.POSTGRES_PASSWORD,
            host=self.POSTGRES_HOST,
            port=self.POSTGRES_PORT,
            path=self.POSTGRES_DB,
        ).unicode_string()


settings = Settings()


if __name__ == "__main__":
    print(settings.model_dump())
