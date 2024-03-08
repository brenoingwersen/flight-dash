import os
os.environ["TEST_MODE"] = "True"
os.environ["DATABASE_URL"] = "sqlite:///./test.db"

import pytest
from tests.init_test_db import init_test_db
from starlette.testclient import TestClient
from loguru import logger

# App
from main import app

# Utils
from uuid import UUID
from datetime import datetime


@pytest.fixture(scope="function")
def test_db():
    db_url = os.getenv("DATABASE_URL")
    init_test_db(db_url)
    
    yield 
    
    # Drop the database after the test function completes
    os.remove("./test.db")


@pytest.fixture(scope="function")  # Run for every .py
def test_app(test_db):
    """
    Set up the testing environment
    """
    client = TestClient(app)
    yield client
