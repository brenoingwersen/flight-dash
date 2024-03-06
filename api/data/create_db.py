import os
from pathlib import Path
import pandas as pd
import sqlite3
from zipfile import ZipFile
from tempfile import TemporaryDirectory
from uuid import uuid4
from datetime import timedelta


# Read the data
with ZipFile("data.zip", "r") as zf:
    with TemporaryDirectory() as tempdir:
        # Extracts the zip file's content to a temporary directory
        zf.extractall(tempdir)
        # Get files paths
        airlines_path = os.path.join(tempdir, "airlines.csv")
        airports_path = os.path.join(tempdir, "airports.csv")
        flights_path = os.path.join(tempdir, "flights.csv")
        # Read the data into Pandas DataFrames
        airlines_df = pd.read_csv(airlines_path)
        airports_df = pd.read_csv(airports_path)

        usecols = ["year", "month", "day",
                   "airline", "origin_airport",
                   "destination_airport",
                   "scheduled_departure",
                   "distance", "scheduled_arrival",
                   "arrival_delay", "diverted",
                   "cancelled", "cancellation_reason",
                   "air_system_delay", "security_delay",
                   "airline_delay", "late_aircraft_delay",
                   "weather_delay"]
        dtype = {"year": str, "month": str, "day": str,
                 "scheduled_departure": str, "scheduled_arrival": str}
        usecols = [col.upper() for col in usecols]
        dtype = {k.upper(): v for k, v in dtype.items()}
        flights_df = pd.read_csv(flights_path,
                                 usecols=usecols,
                                 dtype=dtype,
                                 nrows=1000)

# Lowercasing the columns names
airlines_df.columns = [col.lower() for col in airlines_df.columns]
airports_df.columns = [col.lower() for col in airports_df.columns]
flights_df.columns = [col.lower() for col in flights_df.columns]

# Helper functions


def generate_uuid() -> str:
    """
    Returns an uuid as string.
    """
    return str(uuid4())


def airlines_preprocess(df: pd.DataFrame) -> pd.DataFrame:
    """
    Preprocessing function for airlines.
    """
    # Copy the original dataframe
    df_copy = df.copy(deep=True)
    df_copy["airline_id"] = df_copy.apply(lambda x: generate_uuid(), axis=1)
    return df_copy[["airline_id"] + [col for col in df_copy.columns if col != "airline_id"]]


def airports_preprocess(df: pd.DataFrame) -> pd.DataFrame:
    """
    Preprocessing function for airports.
    """
    df_copy = df.copy(deep=True)

    # Googling the missing geolocations
    df_copy.loc[96, ["latitude", "longitude"]] = [
        30.355631972483877, -85.79953485767247]
    df_copy.loc[234, ["latitude", "longitude"]] = [
        44.657707466818955, -73.46705576127248]
    df_copy.loc[313, ["latitude", "longitude"]] = [
        29.954622367387426, -81.34288087330134]

    # Add id column
    df_copy["airport_id"] = df_copy.apply(lambda x: generate_uuid(), axis=1)
    return df_copy[["airport_id"] + [col for col in df_copy.columns if col != "airport_id"]]


def flights_preprocess(df: pd.DataFrame) -> pd.DataFrame:
    """
    Preprocessing function for flights.
    """
    df_copy = df.copy(deep=True)

    # Add id column
    df_copy["flight_id"] = df_copy.apply(lambda x: generate_uuid(), axis=1)

    # Flights status
    df_copy["status"] = "landed"
    df_copy.loc[df_copy["cancelled"] == 1, "status"] = "cancelled"
    df_copy.loc[df_copy["diverted"] == 1, "status"] = "diverted"
    df_copy.drop(columns=["cancelled", "diverted"], inplace=True)

    # Date
    df_copy["date"] = pd.to_datetime(flights_df[["year", "month", "day"]])
    df_copy.drop(columns=["year", "month", "day"], inplace=True)

    # Datetime columns
    for col in ["scheduled_departure", "scheduled_arrival"]:
        df_copy[col] = df_copy["date"] + df_copy[col].apply(lambda x: timedelta(hours=int(x[:2]), minutes=int(x[2:])))
    df_copy.drop(columns=["date"])

    # Delays
    for col in ["air_system_delay", "security_delay",
                "airline_delay", "late_aircraft_delay",
                "weather_delay"]:
        df_copy.fillna({col: 0}, inplace=True)
        df_copy.loc[df_copy[col] > 0, col] = 1

    return df_copy


def join_dataframes(flights_df: pd.DataFrame,
                    airlines_df: pd.DataFrame,
                    airports_df: pd.DataFrame) -> pd.DataFrame:
    """
    Run simple joins to get airline_id and airport_id
    """
    airlines_ids = airlines_df.set_index(
        "iata_code")["airline_id"].copy(deep=True)
    airports_ids = airports_df.set_index(
        "iata_code")["airport_id"].copy(deep=True)

    flights_copy = flights_df.copy(deep=True)

    # Get airline_id
    flights_copy = pd.merge(left=flights_copy,
                            right=airlines_ids,
                            left_on="airline",
                            right_index=True, how="left",
                            validate="many_to_one")

    # Get origin_airport_id
    flights_copy = pd.merge(left=flights_copy,
                            right=airports_ids.rename("origin_airport_id"),
                            left_on="origin_airport",
                            right_index=True, how="left",
                            validate="many_to_one")

    # Get destination_airport_id
    flights_copy = pd.merge(left=flights_copy,
                            right=airports_ids.rename(
                                "destination_airport_id"),
                            left_on="destination_airport",
                            right_index=True, how="left",
                            validate="many_to_one")
    flights_copy.drop(
        columns=["airline", "origin_airport", "destination_airport"])
    return flights_copy[["flight_id", "airline_id", "origin_airport_id", "destination_airport_id",
                         "distance", "scheduled_departure", "scheduled_arrival",
                         "arrival_delay", "status", "cancellation_reason",
                         "air_system_delay", "security_delay", "airline_delay",
                         "late_aircraft_delay", "weather_delay"]]


# Run preprocessing of the data
airlines_df = airlines_preprocess(airlines_df)
airports_df = airports_preprocess(airports_df)
flights_df = flights_preprocess(flights_df)
flights_df = join_dataframes(flights_df, airlines_df, airports_df)

# Save to a SQLite .db file
db_path = Path(__file__).parent / "../data.db"
with sqlite3.connect(db_path) as conn:
    # flights table
    flights_df.to_sql(name="flights",
                      con=conn,
                      if_exists="replace",
                      index=False)
    # airlines table
    airlines_df.to_sql(name="airlines",
                       con=conn,
                       if_exists="replace",
                       index=False)
    # airports table
    airports_df.to_sql(name="airports",
                       con=conn,
                       if_exists="replace",
                       index=False)
