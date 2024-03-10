from core.config import settings
from sqlalchemy import create_engine


engine = create_engine(settings.SQLALCHEMY_DATABASE_URI)