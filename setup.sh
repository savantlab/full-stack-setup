#!/bin/bash

# Development Environment Setup Script
# This script sets up a Python virtual environment with Selenium and common dependencies

set -e  # Exit on error

echo "🚀 Starting development environment setup..."

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if Python 3 is installed
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}❌ Python 3 is not installed. Please install Python 3.8 or higher.${NC}"
    exit 1
fi

PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
echo -e "${GREEN}✓ Found Python $PYTHON_VERSION${NC}"

# Create virtual environment
if [ -d "venv" ]; then
    echo -e "${YELLOW}⚠️  Virtual environment already exists. Skipping creation.${NC}"
else
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
    echo -e "${GREEN}✓ Virtual environment created${NC}"
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "📥 Upgrading pip..."
pip install --upgrade pip

# Install Selenium and common dependencies
echo "📚 Installing Python packages..."
pip install selenium
pip install webdriver-manager  # Automatically manages browser drivers
pip install python-dotenv       # For environment variables
pip install requests           # For API calls
pip install pytest            # For testing
pip install black             # Code formatter
pip install flake8            # Linter

# Create requirements.txt
echo "📝 Creating requirements.txt..."
pip freeze > requirements.txt
echo -e "${GREEN}✓ requirements.txt created${NC}"

# Create .env.example file
if [ ! -f ".env.example" ]; then
    echo "📄 Creating .env.example..."
    cat > .env.example << 'EOF'
# Environment Configuration Example
# Copy this file to .env and fill in your values

# Application Settings
APP_ENV=development
DEBUG=True
PORT=5000

# API Keys (NEVER commit actual keys)
API_KEY=your_api_key_here
SECRET_KEY=your_secret_key_here

# Database (if needed)
DATABASE_URL=sqlite:///dev.db

# External Services
# Add your service configurations here
EOF
    echo -e "${GREEN}✓ .env.example created${NC}"
fi

# Create .gitignore if it doesn't exist
if [ ! -f ".gitignore" ]; then
    echo "📄 Creating .gitignore..."
    cat > .gitignore << 'EOF'
# Virtual Environment
venv/
env/
ENV/

# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg

# Environment variables
.env
.env.local

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
Thumbs.db

# Testing
.pytest_cache/
.coverage
htmlcov/

# Selenium
*.log
screenshots/
EOF
    echo -e "${GREEN}✓ .gitignore created${NC}"
fi

# Create basic project structure
echo "📁 Creating project structure..."
mkdir -p tests
mkdir -p docs
mkdir -p services
mkdir -p shared

# Initialize git repository if not already initialized
if [ ! -d ".git" ]; then
    echo "🔧 Initializing git repository..."
    git init
    echo -e "${GREEN}✓ Git repository initialized${NC}"
else
    echo -e "${YELLOW}⚠️  Git repository already exists. Skipping initialization.${NC}"
fi

# Prompt for remote repository URL
echo ""
read -p "Enter remote repository URL (or 'False' to skip): " REMOTE_URL

if [ "$REMOTE_URL" = "False" ] || [ -z "$REMOTE_URL" ]; then
    echo -e "${YELLOW}⚠️  Skipped adding remote repository${NC}"
elif [ -n "$REMOTE_URL" ]; then
    # Check if origin already exists
    if git remote | grep -q "^origin$"; then
        echo -e "${YELLOW}⚠️  Remote 'origin' already exists. Skipping.${NC}"
    else
        git remote add origin "$REMOTE_URL"
        echo -e "${GREEN}✓ Remote origin added: $REMOTE_URL${NC}"
    fi
fi

# Create README if it doesn't exist
if [ ! -f "README.md" ]; then
    echo "📄 Creating README.md..."
    cat > README.md << 'EOF'
# Project Name

A mobile-first, microservices-based application.

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
EOF
    echo -e "${GREEN}✓ README.md created${NC}"
fi

# Create initial commit and push if remote exists
if git remote | grep -q "^origin$"; then
    echo ""
    echo "📤 Creating initial commit and pushing to remote..."
    
    # Check if there are any changes to commit
    if [ -n "$(git status --porcelain)" ]; then
        git add .
        git commit -m "Initial commit: Project setup

Co-Authored-By: Warp <agent@warp.dev>"
        echo -e "${GREEN}✓ Initial commit created${NC}"
        
        # Push to remote
        git push -u origin main
        echo -e "${GREEN}✓ Pushed to remote repository${NC}"
    else
        echo -e "${YELLOW}⚠️  No changes to commit${NC}"
    fi
fi

echo ""
echo -e "${GREEN}✅ Setup complete!${NC}"
echo ""
echo "Next steps:"
echo "1. Activate the virtual environment: ${YELLOW}source venv/bin/activate${NC}"
echo "2. Copy .env.example to .env: ${YELLOW}cp .env.example .env${NC}"
echo "3. Configure your environment variables in .env"
echo "4. Start building! 🎉"
echo ""
