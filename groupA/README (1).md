# CareLink Backend

Python FastAPI backend with a MySQL database for **CareLink**, a healthcare-related project with a Flutter/Dart mobile application.

> **Project status:** Early development. The environment, database and FastAPI–MySQL connection are working and tested. Authentication and all application modules are **not yet implemented**.

## Purpose

The backend is intended to support clinic management, patient management, patient visits, user authentication and offline data synchronisation for the CareLink mobile app.

## Key Objectives

- Provide a secure REST API for the Flutter mobile application.
- Store clinic, user, patient and visit data in MySQL.
- Support offline synchronisation with conflict detection.
- Deploy a monitored, production-ready backend.

## Technology Stack

| Technology | Purpose | Status |
|---|---|---|
| Python | Backend language | In use |
| FastAPI | API framework (auto-generated Swagger UI) | In use |
| Uvicorn | ASGI server | In use |
| MySQL 8 | Database | In use |
| SQLAlchemy | Database toolkit | In use |
| PyMySQL | MySQL driver | In use |
| python-dotenv | Environment configuration | In use |
| bcrypt | Password hashing | Planned |
| JWT | Token authentication | Planned |
| Flutter / Dart | Mobile app | Intended client; not yet integrated |

## Current Implementation Status

| Area | Status |
|---|---|
| Development environment (Python, venv, packages, MySQL 8) | ✅ Implemented and tested |
| Database `carelink_db` with five tables | ✅ Implemented; tables detected by `/db-check` |
| FastAPI starts with Uvicorn; Swagger UI accessible | ✅ Implemented and tested |
| FastAPI ↔ MySQL connection (`/db-check` returns HTTP 200) | ✅ Implemented and tested |
| Project structure correction (`app/__init__.py`, `.env.example` added) | ✅ Reported by developer; confirm with directory listing |
| User registration, authentication, password hashing, JWT | ⏳ Planned |
| Clinic, patient and visit management | ⏳ Planned |
| Offline synchronisation and conflict resolution | ⏳ Planned |
| Automated tests | ⏳ Planned |
| Flutter integration | ⏳ Planned |
| Deployment | ⏳ Planned |

No functionality is currently classified as "implemented but not fully tested".

## Architecture Overview

```text
Flutter Mobile App  <--HTTP/JSON-->  FastAPI Backend  <--SQLAlchemy + PyMySQL-->  MySQL 8 (carelink_db)
   (planned link)                     (implemented)                                  (implemented)
```

The mobile app will communicate only with the API and never directly with the database.

## Project Structure

As reported in the current project structure (the local `venv/` folder is not tracked):

```text
backend/
├── CareLink_Backend_Development_Report.docx
├── README.md
├── .env                   # private, never committed
├── .env.example           # safe template
├── .gitignore
├── requirements.txt
└── app/
    ├── __init__.py
    ├── main.py
    ├── database.py
    ├── routers/
    ├── services/
    └── utils/
```

## Database

Database name: `carelink_db` (MySQL 8).

| Table | Intended role |
|---|---|
| `clinics` | Clinic information |
| `users` | System user accounts |
| `patients` | Patient records |
| `visits` | Patient visit records |
| `sync_conflicts` | Offline synchronisation conflicts |

Column definitions, relationships and constraints are not yet documented here and require schema inspection (`DESCRIBE <table>;`).

## Prerequisites

- Python 3.x
- MySQL 8
- Git (optional)

## Getting Started

### 1. Obtain the project

```bash
git clone <repository-url>
cd backend
```

### 2. Create and activate a virtual environment

```bash
python -m venv venv
venv\Scripts\activate        # Windows
# source venv/bin/activate   # macOS / Linux
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Create the database

```sql
CREATE DATABASE carelink_db;
```

Then create the five tables. *(Table creation script to be added to the repository.)*

### 5. Configure environment variables

Copy the provided `.env.example` to `.env` and fill in your own values. **Never commit `.env`.**

```env
# .env.example  (variable names must match those used in app/database.py)
DB_HOST=localhost
DB_PORT=3306
DB_USER=your_mysql_user
DB_PASSWORD=your_password_here
DB_NAME=carelink_db
```

### 6. Run the application

```bash
uvicorn app.main:app --reload
```

Swagger UI: <http://127.0.0.1:8000/docs>

## API Endpoints

Only verified routes are listed.

| Method | Path | Description | Status |
|---|---|---|---|
| GET | `/db-check` | Reports connection status, database name, MySQL version, tables found and missing tables | Tested – HTTP 200 |

Reported result: status `connected`, database `carelink_db`, MySQL `8.0.46`, all five tables found, none missing.

## Testing the Database Connection

1. Ensure the MySQL service is running.
2. Start the API with `uvicorn app.main:app --reload` and open `/docs`.
3. Execute `GET /db-check` and confirm HTTP 200 with no missing tables.

> An earlier standalone diagnostic script (`test_connection.py`) was used during development but is not in the current project structure.

## Known Limitations

- No authentication or authorisation yet.
- No clinic, patient or visit endpoints.
- No synchronisation logic.
- No automated test suite.
- Project structure is as reported by the developer and has not been verified by directory listing.
- No standalone connection-test script in the current structure.
- Table schemas not yet documented.

## Roadmap

1. Correct and verify project structure
2. User registration and authentication
3. Password hashing and JWT
4. Clinic management
5. Patient management
6. Visit management
7. Offline synchronisation
8. Conflict detection and resolution
9. API integration and validation
10. Security improvements
11. Automated testing
12. Flutter integration
13. Production configuration
14. Deployment
15. Monitoring and maintenance

## Security Considerations

- Keep `.env` out of version control (listed in `.gitignore`).
- Never publish database passwords, JWT secrets or API keys.
- Use synthetic data only in examples and tests.
- Passwords will be hashed with bcrypt before storage (planned).
- Real patient data must not be used until authentication and access controls are implemented.

## Contribution and Maintenance Notes

- Keep this README and the development report consistent with the code.
- Mark features complete only after they are implemented and tested.
- Record errors and their solutions in the development report.

## License

*No license selected yet.* [Add license here]
