# full-stack-setup

A comprehensive development environment template for building mobile-first, full-stack applications with a microservices architecture. This template provides an opinionated setup with Python, Selenium, and essential development tools, optimized for AI-assisted development workflows using Warp terminal.

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

### Quick Start

1. **Run the automated setup script:**
   ```bash
   ./setup.sh
   ```
   
   This script will:
   - Verify Python 3 installation
   - Create a virtual environment (`venv/`)
   - Install all required packages (Selenium, pytest, black, flake8, webdriver-manager, etc.)
   - Generate configuration files (`.env.example`, `.gitignore`, `requirements.txt`)
   - Create project directory structure (`services/`, `shared/`, `tests/`, `docs/`)
   - Initialize git repository (if needed)
   - Prompt for remote repository URL
   - Create initial commit and push to remote (if configured)

2. **Activate the virtual environment:**
   ```bash
   source venv/bin/activate
   ```
   You'll need to do this in each new terminal session.

3. **Configure environment variables:**
   ```bash
   cp .env.example .env
   ```
   Edit `.env` with your specific configuration values (API keys, database URLs, etc.).

### What's Included

- **Python Virtual Environment**: Isolated dependency management
- **Selenium & WebDriver Manager**: Browser automation with automatic driver management
- **Testing Framework**: pytest with coverage tools
- **Code Quality**: black (formatter) and flake8 (linter)
- **Environment Management**: python-dotenv for secure configuration
- **API Tools**: requests library for HTTP interactions
- **Project Structure**: Pre-configured directories for microservices architecture

## Running the Application

This template is technology-agnostic. Add your specific application startup instructions here based on your chosen stack.

For Selenium automation scripts, ensure your virtual environment is activated and run:
```bash
python your_selenium_script.py
```

## Testing

Run the test suite with pytest:

```bash
# Run all tests
pytest

# Run with coverage report
pytest --cov

# Run specific test file
pytest tests/test_example.py

# Run with verbose output
pytest -v
```

## Architecture

This project follows a **microservices architecture** with the following principles:

- **Mobile-First Design**: UI components designed for mobile, then scaled up
- **Service Independence**: Each microservice has a single, well-defined responsibility
- **API-Based Communication**: Services communicate via RESTful or GraphQL APIs
- **Technology Flexibility**: Choose the best tool for each service's specific needs
- **Containerization**: Services should be Docker-ready for deployment

See `WARP.md` for AI agent instructions and `PROMPT_RULES.md` for development guidelines.

## Project Structure

```
.
├── services/           # Microservices (add your services here)
├── shared/            # Shared utilities, types, and configurations
├── tests/             # Test suites
├── docs/              # Project documentation
├── venv/              # Virtual environment (created by setup.sh)
├── .env               # Environment variables (create from .env.example)
├── WARP.md           # AI agent instructions
├── PROMPT_RULES.md   # Development rules and guidelines
├── setup.sh          # Automated environment setup
└── requirements.txt  # Python dependencies
```

## Contributing

### Development Workflow

1. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes** following the guidelines in `PROMPT_RULES.md`

3. **Run tests and linting**:
   ```bash
   pytest
   black .
   flake8
   ```

4. **Commit with descriptive messages**:
   ```bash
   git commit -m "Add feature: description"
   ```

5. **Push and create a pull request**:
   ```bash
   git push origin feature/your-feature-name
   ```

### Code Quality Standards

- Write clean, self-documenting code
- Follow mobile-first design principles
- Maintain 80%+ test coverage
- Use meaningful variable and function names
- Document all API endpoints
- Never commit secrets or credentials

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

[Add contact information or links to documentation]
