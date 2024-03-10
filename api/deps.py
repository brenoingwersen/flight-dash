from fastapi import Depends
from core.db import engine
from sqlalchemy.orm import sessionmaker, Session
from typing import Generator, Annotated


# Defining a local session maker
SessionLocal = sessionmaker(autocommit=False,
                            autoflush=False,
                            bind=engine)


def get_db() -> Generator[Session, None, None]:
    """
    Dependency for generating sessions.
    """
    session = SessionLocal()

    try:
        yield session
    except:
        # If any exceptions then rollback
        session.rollback()
        raise
    finally:
        # Always close the session
        session.close()


SessionDep = Annotated[Session, Depends(get_db)]