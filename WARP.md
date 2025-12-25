# WARP Agent Instructions

## Project Overview
This is a mobile-first, full-stack application built with microservices architecture and API-based communication.

**IMPORTANT**: Before starting any work, read and follow the guidelines in `PROMPT_RULES.md`.

## Architecture Principles
- **Mobile-First Design**: All UI components and features should be designed for mobile devices first, then scaled up for desktop
- **Microservices Architecture**: Services should be loosely coupled, independently deployable, and communicate via APIs
- **API-Based Communication**: RESTful or GraphQL APIs for inter-service communication
- **Technology Agnostic**: Choose the best technology stack for each specific project requirement

## Development Environment Setup

### Initial Setup
1. Run the setup script to create virtual environment and install dependencies:
   ```bash
   ./setup.sh
   ```

2. Activate the virtual environment:
   ```bash
   source venv/bin/activate
   ```

### Running the Application
- Refer to project-specific README.md for startup instructions
- Common patterns:
  - Flask apps: Use `flask_driver_runner.py` with options for headless mode and port specification
  - Node.js apps: `npm run dev` or `npm start`
  - Django apps: `python manage.py runserver`

## Project Structure Guidelines
```
project-root/
├── services/           # Microservices
│   ├── service-a/
│   ├── service-b/
├── shared/            # Shared utilities, types, configs
├── docs/              # Documentation
├── tests/             # Test suites
├── WARP.md           # This file
├── PROMPT_RULES.md   # Development rules
└── setup.sh          # Environment setup script
```

## Testing
- Write tests for all API endpoints
- Test mobile responsiveness at common breakpoints (320px, 375px, 768px, 1024px)
- Run automated tests before commits

## Deployment
- Each microservice should be containerized (Docker)
- Use environment variables for configuration
- Implement health check endpoints for all services
