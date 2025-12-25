# full-stack-setup

A mobile-first, microservices-based application.

## Development Environment

This project is designed for a **dual window Warp terminal workflow**:

### Window 1: AI Agent & Code Changes
- Use WARP AI agent to generate and modify code
- Run git commands and manage version control
- Execute setup and configuration tasks

### Window 2: Application Runtime
- Activate virtual environment: `source venv/bin/activate`
- Run your application (Flask, Django, Node.js, etc.)
- Monitor Selenium tests and browser automation
- View application logs and output

This dual-window approach keeps your development server running uninterrupted while you work on code changes in parallel.

## Setup

1. Run the setup script:
   ```bash
   ./setup.sh
   ```

2. Activate the virtual environment:
   ```bash
   source venv/bin/activate
   ```

3. Copy `.env.example` to `.env` and configure your environment variables:
   ```bash
   cp .env.example .env
   ```

## Running the Application

[Add project-specific instructions here]

## Testing

```bash
pytest
```

## Architecture

This project follows a microservices architecture. See `docs/` for detailed documentation.

## Contributing

[Add contribution guidelines]
