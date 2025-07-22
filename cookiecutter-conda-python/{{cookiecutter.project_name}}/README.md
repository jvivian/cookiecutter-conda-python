# {{cookiecutter.project_name}}

[![CI](https://github.com/{{cookiecutter.github_username}}/{{cookiecutter.project_name}}/workflows/CI/badge.svg)](https://github.com/{{cookiecutter.github_username}}/{{cookiecutter.project_name}}/actions)
{% if cookiecutter.use_pytest == 'y' -%}
[![codecov](https://codecov.io/gh/{{cookiecutter.github_username}}/{{cookiecutter.project_name}}/branch/main/graph/badge.svg)](https://codecov.io/gh/{{cookiecutter.github_username}}/{{cookiecutter.project_name}})
{%- endif %}
[![Python {{cookiecutter.python_version}}+](https://img.shields.io/badge/python-{{cookiecutter.python_version}}+-blue.svg)](https://www.python.org/downloads/)
[![License: {{cookiecutter.license}}](https://img.shields.io/badge/License-{{cookiecutter.license}}-yellow.svg)](https://opensource.org/licenses/{{cookiecutter.license}})

{{cookiecutter.project_short_description}}

## Installation

### Using Conda (Recommended)

```bash
# Clone the repository
git clone https://github.com/{{cookiecutter.github_username}}/{{cookiecutter.project_name}}.git
cd {{cookiecutter.project_name}}

# Create conda environment from environment.yml
conda env create -f environment.yml

# Activate the environment
conda activate {{cookiecutter.project_name}}
```

### Development Installation

For development, use the development environment which includes testing and linting tools:

```bash
# Create development environment
conda env create -f environment-dev.yml

# Activate the environment
conda activate {{cookiecutter.project_name}}-dev

# Install pre-commit hooks
pre-commit install
```

### Using pip

```bash
pip install {{cookiecutter.project_name}}
```

## Quick Start

```python
import {{cookiecutter.package_name}}

# Your code here
```

{% if cookiecutter.include_cli == 'y' -%}
### Command Line Interface

```bash
{{cookiecutter.project_name}} --help
```
{%- endif %}

## Features

- Feature 1
- Feature 2
- Feature 3

## Documentation

{% if cookiecutter.use_sphinx_docs == 'y' -%}
Full documentation is available at [https://{{cookiecutter.github_username}}.github.io/{{cookiecutter.project_name}}/](https://{{cookiecutter.github_username}}.github.io/{{cookiecutter.project_name}}/)
{%- endif %}

{% if cookiecutter.use_mkdocs == 'y' -%}
Full documentation is available at [https://{{cookiecutter.github_username}}.github.io/{{cookiecutter.project_name}}/](https://{{cookiecutter.github_username}}.github.io/{{cookiecutter.project_name}}/)
{%- endif %}

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Setup

1. Fork the repository
2. Create a new branch for your feature
3. Make your changes
4. Run the tests
5. Submit a pull request

### Running Tests

```bash
{% if cookiecutter.use_pytest == 'y' -%}
pytest
{%- endif %}
```

### Code Formatting

{% if cookiecutter.use_black == 'y' -%}
This project uses [Black](https://black.readthedocs.io/) for code formatting:

```bash
black {{cookiecutter.package_name}}/ tests/
```
{%- endif %}

{% if cookiecutter.use_ruff == 'y' -%}
And [Ruff](https://docs.astral.sh/ruff/) for linting:

```bash
ruff check {{cookiecutter.package_name}}/ tests/
```
{%- endif %}

## License

This project is licensed under the {{cookiecutter.license}} License - see the [LICENSE](LICENSE) file for details.

## Authors

- **{{cookiecutter.author_name}}** - *Initial work* - [{{cookiecutter.github_username}}](https://github.com/{{cookiecutter.github_username}})

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc