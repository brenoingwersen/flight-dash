import os
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.pool import NullPool


# Database url
DATABASE_URL = os.getenv("DATABASE_URL")
connect_args = {}
if not DATABASE_URL:
    DATABASE_URL = "sqlite:///./data.db"
    # Prevents SQLite to share the same connection for different requests
    connect_args.update({"check_same_thread": False})

# SQLAlchemy engine
# Test mode
if bool(str(os.getenv("TEST_MODE")).title()):
    # NullPool opens and closes the underlying DB-API connection per each connection open/close.
    engine = create_engine(DATABASE_URL, 
                           poolclass=NullPool,
                           connect_args=connect_args)
else:
    engine = create_engine(DATABASE_URL,
                           connect_args=connect_args)

# Create a sessionmaker to create a session
SessionLocal = sessionmaker(autocommit=False,
                            autoflush=False,
                            bind=engine)


class UnitOfWork:
    """
    Unit of Work pattern.
    """
    def __enter__(self):
        self.session = SessionLocal()
        return self
    
    def __exit__(self, exc_type, exc_val, traceback):
        if exc_type is not None:
            self.rollback()
            self.session.close()
        self.session.close()

    def commit(self):
        self.session.commit()
    
    def rollback(self):
        self.session.rollback()