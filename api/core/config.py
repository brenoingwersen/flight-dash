from pydantic import Field, computed_field
from pydantic_settings import BaseSettings, SettingsConfigDict
from pydantic import PostgresDsn
from pydantic_core import MultiHostUrl


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_file="./.env",
                                      env_ignore_empty=True)

    API_VERSION: str
    TITLE: str = "Flights API"
    SUMMARY: str = "An API for managing flight data."
    DESCRIPTION: str = "This API allows users to access and manage flight data,\
        including flight schedules, list flights per airport and airline and check cancellations."

    
    # Database connection configurations
    DATABASE_TYPE: str = Field(..., env="DATABASE_TYPE")
    DATABASE_NAME: str = Field(..., env="DATABASE_NAME")

    # PostgreSQL connection string
    POSTGRES_USER: str = Field(..., env="POSTGRES_USER")
    POSTGRES_PASSWORD: str = Field(..., env="POSTGRES_PASSWORD")
    POSTGRES_HOST: str = Field(..., env="POSTGRES_HOST")
    POSTGRES_PORT: int = Field(..., env="POSTGRES_PORT")
    POSTGRES_DB: str = Field(..., env="POSTGRES_DB")

    @computed_field
    def SQLITE_DATABASE_URI(self) -> str:
        return f"sqlite:///{self.DATABASE_NAME}.db"
    
    @computed_field
    def POSTGRES_DATABASE_URI(self) -> str:
        return MultiHostUrl.build(
            scheme="postgresql+psycopg",
            username=self.POSTGRES_USER,
            password=self.POSTGRES_PASSWORD,
            host=self.POSTGRES_HOST,
            port=self.POSTGRES_PORT,
            path=self.POSTGRES_DB,
        ).unicode_string()
    
    @computed_field
    def SQLALCHEMY_DATABASE_URI(self) -> str:
        """
        Sets the final connection string for the API.
        """
        if self.DATABASE_TYPE == "postgresql":
            return self.POSTGRES_DATABASE_URI
        return self.SQLITE_DATABASE_URI


settings = Settings()


if __name__ == "__main__":
    print(settings.model_dump())
