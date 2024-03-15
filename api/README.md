# Flights Dashboard - Backend

## Requirements
- [Docker](https://www.docker.com/).
- [Pipenv](https://pipenv.pypa.io/en/latest/) for Python package and environment.

## Local development
### Using a local SQLite db file
This section guides you through the process of downloading the flights data on Kaggle and creating a local SQLite db file with the data. In the production environment the database would be stored by a cloud provider and accessed using a [db connection string](https://docs.sqlalchemy.org/en/20/core/engines.html#database-urls) provided in a `.env` file.

1. Download the data and add the data.zip file to the `api/data/` directory:
```
flights_dash
├── api
│   └── data
│   │   ├── data_processing.py
│   │   ├── data.zip
│   │   └── init_db.py
...
```
- `data_processing.py`: Python module that reads and preprocess the raw data.
- `init_db.py`: Python module that creates the `data.db` file using the preprocessed data, SQLAlchemy models and Pydantic schemas.

2. Cd into the backend, download the projects' dependencies and start the virtualenv using Pipenv:
```bash
cd api/
pipenv install # Downloads dependencies from Pipfile.lock
pipenv shell # Starts the virtualenv
```

3. Cd into the `data/` directory and run the `init_db.py` Python module to preprocess the data from `data.zip`, create the db models using SQLAlchemy and saving the data to a SQLite `data.db` file.
```bash
cd data/
python init_db.py
```

Now the backend folder should have a `data.db` file:
```
flights_dash
├── api
│   └── data
│   │   ├── data_processing.py
│   │   ├── data.zip
│   │   └── init_db.py
│   └── data.db
...
```

4. Run the local server using uvicorn
```bash
cd api/
uvicorn main:app --reload
```

The server should be up now and the API docs should be available on http://localhost:8000/docs.

## Run using Docker Compose
```bash
docker compose up -d --build
```
The server should be up now and the API docs should be available on http://localhost:8000/docs.

To stop the container run the command:
```bash
docker compose down
```

## Backend tests
To test the API run the tests using Pytest:
```bash
pytest
```

### Test running stack
If the API is [already up](#run-using-docker-compose) in the background and you want to run the tests, you can use:
```bash
sudo docker compose exec api pytest
```