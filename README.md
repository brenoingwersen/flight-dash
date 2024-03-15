# Flights Dashboard

A dashboard service for displaying flights, airports and aircompanies data. This project is based on the data available on Kaggle through the following link: [2015 Flight Delays and Cancellations](https://www.kaggle.com/datasets/usdot/flight-delays).

## Features
- [x] API on the backend to fetch and save data to our database.
- [ ] Frontend interactive dashboard.
- [ ] Add frontend responsiveness.

## Tech Stack
- Backend: FastAPI.
- Frontend: React, html, css and JavaScript.

## Installation
1. Clone the repository:
```bash
git clone "https://github.com/brenoingwersen/flight-dash.git"
```

2. Navigate to the project directory:
```bash
cd flight-dash
```

3. Install dependencies and run the virtual env using Pipenv:
```bash
pipenv install
pipenv shell
```

## Backend (In progress)
Backend docs: [api/README.md](https://github.com/brenoingwersen/flight-dash/tree/main/api)

### Run using Docker compose
This command runs the container using docker on detached mode - i.e. the server is running on the background of the terminal.
```bash
docker compose up -d --build
```
The server should be up now and the API docs should be available on http://localhost:8000/docs.

To stop the container run the command:
```bash
docker compose down
```

## Frontend (To be Developed)
The frontend of the application will provide an interactive dashboard for visualizing the flight data. It will be developed using React to ensure a modern and responsive user interface. Stay tuned for updates on the frontend development progress.

## Useful Resources
A list of useful resources that helped me throughout the project.

- [Conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) - The Conventional Commits specification is a lightweight convention on top of commit messages. It provides an easy set of rules for creating an explicit commit history.
- [The Blue Book](https://lyz-code.github.io/blue-book/) - A *Digital Garden* created by Lyz with contributions. There's a section on [FastAPI](https://lyz-code.github.io/blue-book/fastapi/). But checkout the other sections for a really nice content.