# {{cookiecutter.project_name}}/{{cookiecutter.package_name}}/__init__.py
"""{{cookiecutter.project_short_description}}"""

__version__ = "{{cookiecutter.version}}"
__author__ = "{{cookiecutter.author_name}}"
__email__ = "{{cookiecutter.author_email}}"

from .core import hello_world

__all__ = ["hello_world"]


# {{cookiecutter.project_name}}/{{cookiecutter.package_name}}/core.py
"""Core functionality for {{cookiecutter.package_name}}."""


def hello_world() -> str:
    """Return a hello world message.
    
    Returns:
        str: A greeting message.
    """
    return "Hello from {{cookiecutter.package_name}}!"


def add_numbers(a: float, b: float) -> float:
    """Add two numbers together.
    
    Args:
        a: First number
        b: Second number
        
    Returns:
        The sum of a and b
    """
    return a + b


{% if cookiecutter.include_cli == 'y' -%}
# {{cookiecutter.project_name}}/{{cookiecutter.package_name}}/cli.py
"""Command line interface for {{cookiecutter.package_name}}."""

import argparse
from .core import hello_world


def main() -> None:
    """Main CLI entry point."""
    parser = argparse.ArgumentParser(description="{{cookiecutter.project_short_description}}")
    parser.add_argument(
        "--greeting", 
        action="store_true", 
        help="Show greeting message"
    )
    
    args = parser.parse_args()
    
    if args.greeting:
        print(hello_world())
    else:
        parser.print_help()


if __name__ == "__main__":
    main()
{%- endif %}


# {{cookiecutter.project_name}}/tests/conftest.py
"""Pytest configuration and fixtures."""

import pytest


@pytest.fixture
def sample_data():
    """Sample data for testing."""
    return {"test": "data"}


# {{cookiecutter.project_name}}/tests/test_{{cookiecutter.package_name}}.py
"""Tests for {{cookiecutter.package_name}}."""

{% if cookiecutter.use_pytest == 'y' -%}
import pytest
{%- endif %}

from {{cookiecutter.package_name}}.core import hello_world, add_numbers


def test_hello_world():
    """Test the hello_world function."""
    result = hello_world()
    assert isinstance(result, str)
    assert "{{cookiecutter.package_name}}" in result


def test_add_numbers():
    """Test the add_numbers function."""
    result = add_numbers(2, 3)
    assert result == 5
    
    result = add_numbers(2.5, 3.7)
    assert result == 6.2


{% if cookiecutter.use_pytest == 'y' -%}
@pytest.mark.parametrize("a,b,expected", [
    (1, 2, 3),
    (0, 0, 0),
    (-1, 1, 0),
    (10.5, 2.5, 13.0)
])
def test_add_numbers_parametrized(a, b, expected):
    """Test add_numbers with multiple parameter combinations."""
    assert add_numbers(a, b) == expected
{%- endif %}