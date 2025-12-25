# Development Rules & Guidelines

## Design Philosophy

### Mobile-First Approach
- Always design and implement for mobile screens first
- Progressively enhance for tablet and desktop
- Touch targets should be minimum 44x44px
- Consider thumb zones and one-handed usage
- Test on real devices when possible

### Microservices Architecture
- Each service should have a single, well-defined responsibility
- Services communicate via well-documented APIs
- Implement proper error handling and retry logic
- Use API versioning (e.g., `/api/v1/`)
- Design for failure - services should degrade gracefully

## Code Quality Standards

### General Practices
- Write clean, self-documenting code
- Follow DRY (Don't Repeat Yourself) principle
- Use meaningful variable and function names
- Comment complex logic, not obvious code
- Keep functions small and focused

### API Development
- Use consistent naming conventions across all endpoints
- Implement proper HTTP status codes
- Provide clear error messages with error codes
- Document all endpoints (OpenAPI/Swagger recommended)
- Implement rate limiting and authentication

### Testing Requirements
- Unit tests for business logic
- Integration tests for API endpoints
- End-to-end tests for critical user flows
- Minimum 80% code coverage goal
- Test mobile responsiveness

## Security Practices
- Never commit secrets, API keys, or credentials
- Use environment variables for sensitive configuration
- Implement proper authentication and authorization
- Validate and sanitize all inputs
- Use HTTPS for all API communications
- Implement CORS policies appropriately

## Version Control
- **ALWAYS ask before committing changes** - Never commit without explicit user approval
- Write clear, descriptive commit messages
- Use feature branches for new development
- Keep commits atomic and focused
- Review code before merging to main
- Tag releases with semantic versioning

## Technology Selection Criteria
When choosing technology for a project, consider:
- Team expertise and learning curve
- Community support and documentation
- Performance requirements
- Scalability needs
- Maintenance and long-term support
- Integration capabilities with existing systems

## Documentation
- Keep README.md up to date with setup instructions
- Document API endpoints and data models
- Maintain architecture diagrams for complex systems
- Update WARP.md with project-specific instructions
- Comment non-obvious architectural decisions
