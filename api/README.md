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

### Setting up a local PostgreSQL database

This section goes through obtaining the dummy data from Kaggle and setting up a PostgreSQL database instance to test the API.

First you need to create a new database on your local PostgreSQL [section](#setPostgres).

#### Getting the data using Kaggle API 🆕

The new file `getting_data/kaggle_api.py` will use your Kaggle API credentials to fetch the .zip file with the data. Here's the step by step:

1. Configure the Kaggle API on your local computer: [Kaggle API](https://www.kaggle.com/docs/api).

Basically you'll download a `kaggle.json` file with your profile configurations and place it on the `~/.kaggle/` for WSL or Mac.

2. Simply run Python using pdm to access the virtual environment's dependencies:

```
pdm run python getting_data/init_local_db.py
```

The Kaggle data will be downloaded and if you have correctly set up the PostgreSQL database from the last section then it'll have been populated with the data.

#### Alternative: Manual download

This section guides you through the process of downloading the [flights data](https://www.kaggle.com/datasets/usdot/flight-delays) on Kaggle manually without the need of the Kaggle API credentials (You'd still need an account to get the data though).

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

2. Simply run Python using pdm to access the virtual environment's dependencies:

```
pdm run python getting_data/init_local_db.py
```

### Running the API using PDM

This section goes through the steps to run the backend API.

1. Create a `.env` file with your local PostgreSQL credentials and place it inside `/api`

```
POSTGRES_DB=flight-delays
POSTGRES_USER=postgres
POSTGRES_PASSWORD=user
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
```

2. Run the local server using pdm and uvicorn. Note: You can's simply call the command `uvicorn main:app --reload` because you need to run locally with the dependencies installed inside pdm's virtual environment.

```bash
pdm run uvicorn main:app --reload
```

The server should be up now and the API doc (Open API Specification) should be available on http://localhost:8000/docs.

### Run the API using Docker

This section goes through setting up the API for local development using Docker and connecting to the <u>local PostgreSQL database</u>.

If you're trying to run the API inside a container and connecting to your local PostgreSQL database, you need to allow the connection of the API through the Docker network which is often `172.17.0.1`. The new connection string will be:

```
POSTGRES_USER=postgres
POSTGRES_PASSWORD=my_passord
POSTGRES_HOST=172.17.0.1
POSTGRES_PORT=5432
POSTGRES_DB=flight-delays
```

And you also need to make PostgreSQL accept connections locally from another host other than `127.0.0.1`. You can reference the following [guide](https://dev.to/21toffy/connect-to-locally-hosted-postgresql-from-a-docker-container-109o).

After everything is set, you can setup the container running the next commands.

1. Create the app image using the following command:

```
sudo docker image build -t flight-delays-api:latest -f Dockerfile.dev
```

The `-t` specifies the image tag and `-f` the Dockerfile to be run to create the image.

2. Start the container

```
sudo docker container run -p 8000:8000 flight-delays-api
```

The `-p [host_port]:[container_port]` forwards container port to the host machine.

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

6. Run a simple query to get the first 10 flights: (if you have already populated it...)

```
SELECT * FROM flights LIMIT 10;
```
