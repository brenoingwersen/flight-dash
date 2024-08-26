# Flights Dashboard - Backend

## Requirements

- [Docker](https://www.docker.com/).
- [Pipenv](https://pipenv.pypa.io/en/latest/) for Python package and environment.

## To-dos ⛏

- [x] Write basic endpoints for all models.
- [x] Complete unit tests.
- [ ] Add DB migrations using Alembic.
- [ ] Add custom endpoints for the frontend dashboard.

## God-tier would-like 🧙‍♂️

- [ ] Support authentication API to create users and manage permissions.

## Local development

This section will guide through accessing the data used for the API demo and setting up a local database using SQLite.

To start the API project you need to initialize the pdm environment:

1. Enter the root folder and initialize pdm and install dependencies:

```
cd api
pdm install
```

### Setting up a local database

This section goes through obtaining the dummy data from Kaggle and setting up a database instance to test the API.
Supported databases for local development:

- SQLite
- PostgreSQL 🆕

But first, we need to download the data. If you're planning to use your local PostgreSQL you can firstly refer to how to setup a database on your local postgresql on this [section](#setPostgres).

After that you need to create a configuration file with environments varables called `.env`. The scripts will automatically parse the connection string configurations from the `.env` file.

```
# .env file example

API_VERSION=0.1.0

# Database type
DATABASE_TYPE=postgresql # or sqlite
DATABASE_NAME=flight-delays

# sqlite .db file is created at /{DATABASE_NAME}.db

# Postgres connection parameters
POSTGRES_USER=postgres # The main user at your postgres app
POSTGRES_PASSWORD=my_passord # Change it for the value you configured before
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DB=flight-delays # The database name
```

#### Getting the data using Kaggle API 🆕

The new file `utils/kaggle_api.py` will use your Kaggle API credentials to fetch the .zip file with the data. Here's the step by step:

1. Configure the Kaggle API on your local computer: [Kaggle API](https://www.kaggle.com/docs/api).

Basically you'll download a `kaggle.json` file with your profile configurations and place it on the `~/.kaggle/` for WSL or Mac.

2. Simply run Python using pdm to access the virtual environment's dependencies:

```
pdm run python data/init_db.py
```

Optionally you can specify the type of database you want to be created using the flag `--db-type sqlite` for example and <u>this will override</u> the default creation using PostgreSQL.

The `init_db.py` file will check if the `.zip` file is already in the API folder structure (i.e. if it's been previously downloaded) and run the remaining preprocessing and database creation steps. Finally it'll create a SQLite database file `data.db`.

```
flights_dash
├── api
│   ├── utils/
│   ├── data.db
...
```

#### Alternative: Manual download

This section guides you through the process of downloading the [flights data](https://www.kaggle.com/datasets/usdot/flight-delays) on Kaggle and creating a local SQLite db file with the data. _In the production environment the database would be stored by a cloud provider and accessed using a [db connection string](https://docs.sqlalchemy.org/en/20/core/engines.html#database-urls) provided in a `.env` file._

1. Download the data and add the `flight-delays.zip` file to the `api/` root directory:

```
flights_dash
├── api
│   └── utils
│   │   ├── data_processing.py
│   │   └── init_db.py
│   ├── flight-delays.zip
...
```

- `data_processing.py`: Python module that reads and preprocess the raw data.
- `init_db.py`: Python module that creates the `data.db` file using the preprocessed data, SQLAlchemy models and Pydantic schemas.

2. Simply run Python using pdm to access the virtual environment's dependencies:

```
pdm run python utils/init_db.py
```

Now the backend folder should have a `data.db` file:

```
flights_dash
├── api
│   └── utils
│   │   ├── data_processing.py
│   │   └── init_db.py
│   ├── flight-delays.zip
│   ├── data.db
...
```

### Run the backend API

This section goes through the steps to run the backend API.

1. Check if you have uvicorn downloaded

```
uvicorn --version # checks if uvicorn is available
sudo apt install uvicorn # Installs uvicorn
```

2. Run the local server using pdm and uvicorn. Note: You can's simply call the command `uvicorn main:app --reload` because you need to run locally with the dependencies installed inside pdm's virtual environment.

```bash
pdm run uvicorn main:app --reload
```

The server should be up now and the API doc (Open API Specification) should be available on http://localhost:8000/docs.

## Backend tests

Running API tests using Pytest:

```bash
pdm run pytest
```

## Extra topics

This section is for displaying extra _how-tos_.

### <a name="setPostgres"></a>How to create a PostgreSQL database (WSL)

This section is on how to create a new database named "flight-delays" in your PostgreSQL application.

1. Connect to your local database using command line:

```
psql -h localhost -U postgres
```

This command connects to the database in your localhost provided the command `-h localhost` and uses the user "postgres" to authenticate the connection with `-U postgres`. This will prompt a password which should already be configured when you installed postgresql.

2. Create a new database named "fight-delays":

```
CREATE DATABASE "flight-delays";
```

Don't forget the double quotes and the semi-colon at the end. And it's done. You've created a new database.

3. How to list your available databases:

```
\l
```

Will display all your available databases.

4. Connect to the database calling the command:

```
\c flight-delays
```

5. List tables in the database:

```
\dt
```

6. Run a simple query to get the first 10 flights:

```
SELECT * FROM flights LIMIT 10;
```
