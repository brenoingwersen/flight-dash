FROM python:3.10-slim

RUN mkdir -p /api

WORKDIR /api

RUN pip install -U pip && pip install pipenv

COPY Pipfile Pipfile.lock /api/

# --system tells Docker to install the dependencies system-wide instead of in a venv. It's more efficient since containers are already isolated
# --deploy tells Pipenv to install the exact versions of the dependencies.
RUN pipenv install --system --deploy

COPY . .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]