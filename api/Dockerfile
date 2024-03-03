FROM python:3.10-slim

RUN mkdir -p /api

WORKDIR /api

RUN pip install -U pip && pip install pipenv

COPY Pipfile Pipfile.lock /api/

RUN pipenv install --system --deploy

COPY . /api/

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]