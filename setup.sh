#!/bin/bash

# setup.sh - Create the cookiecutter template directory structure
# Run this script, then copy the artifact files into their respective locations

set -e  # Exit on any error

echo "🚀 Creating cookiecutter-conda-python template structure..."

# Create the main template directory
mkdir -p cookiecutter-conda-python
cd cookiecutter-conda-python

echo "📁 Creating template root structure..."

# Create the main template files (these go in the root)
touch cookiecutter.json
touch README.md

# Create the project template directory (this is what gets generated)
mkdir -p "{{cookiecutter.project_name}}"
cd "{{cookiecutter.project_name}}"

echo "📁 Creating GitHub workflows..."
# GitHub Actions workflows
mkdir -p .github/workflows
touch .github/workflows/ci.yml
touch .github/workflows/docs.yml
touch .github/workflows/release.yml

echo "📁 Creating documentation structure..."
# Documentation structure
mkdir -p docs/source
touch docs/source/conf.py
touch docs/source/index.rst  
touch docs/source/api.rst
touch docs/Makefile
touch docs/make.bat

echo "📁 Creating package structure..."
# Python package directory (no src/)
mkdir -p "{{cookiecutter.package_name}}"
touch "{{cookiecutter.package_name}}/__init__.py"
touch "{{cookiecutter.package_name}}/core.py"
touch "{{cookiecutter.package_name}}/cli.py"

echo "📁 Creating tests structure..."
# Tests directory
mkdir -p tests
touch tests/__init__.py
touch tests/conftest.py
touch "tests/test_{{cookiecutter.package_name}}.py"

echo "📁 Creating project files..."
# Project configuration files
touch environment.yml
touch environment-dev.yml
touch pyproject.toml
touch README.md
touch .gitignore
touch .pre-commit-config.yaml
touch CHANGELOG.md
touch LICENSE

echo "📁 Creating additional template files..."
# Create .gitignore template
cat > .gitignore << 'EOF'
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
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
pip-wheel-metadata/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# PyInstaller
*.manifest
*.spec

# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/
.pytest_cache/

# Jupyter Notebook
.ipynb_checkpoints

# IPython
profile_default/
ipython_config.py

# pyenv
.python-version

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# Spyder project settings
.spyderproject
.spyproject

# mkdocs documentation
/site

# mypy
.mypy_cache/
.dmypy.json
dmypy.json

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
EOF

# Create CHANGELOG template
cat > CHANGELOG.md << 'EOF'
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Initial project setup
- Basic package structure
- CI/CD pipeline with GitHub Actions
- Documentation setup
- Testing framework

## [{{cookiecutter.version}}] - {% now 'utc', '%Y-%m-%d' %}

### Added
- Initial release
EOF

# Go back to the template root
cd ..

echo "🔍 Validating directory structure..."
# Quick validation
expected_files=(
    "cookiecutter.json"
    "{{cookiecutter.project_name}}/.github/workflows/ci.yml"
    "{{cookiecutter.project_name}}/environment.yml"
    "{{cookiecutter.project_name}}/pyproject.toml"
    "{{cookiecutter.project_name}}/{{cookiecutter.package_name}}/__init__.py"
    "{{cookiecutter.project_name}}/tests/conftest.py"
)

all_good=true
for file in "${expected_files[@]}"; do
    if [[ ! -f "$file" ]]; then
        echo "❌ Missing: $file"
        all_good=false
    fi
done

if $all_good; then
    echo "✅ All expected files created successfully!"
else
    echo "⚠️  Some files are missing. Please check the structure."
fi

echo "📋 Creating file map..."
# Create a helpful file map showing where to copy each artifact
cat > FILE_MAP.md << 'EOF'
# Cookiecutter Template File Map

Copy the artifacts to these locations:

## Root Template Files
- `cookiecutter.json` → `cookiecutter-conda-python/cookiecutter.json`

## Project Template Files (in {{cookiecutter.project_name}}/ directory)
- `environment.yml` → `{{cookiecutter.project_name}}/environment.yml`
- `environment-dev.yml` → `{{cookiecutter.project_name}}/environment-dev.yml`
- `pyproject.toml` → `{{cookiecutter.project_name}}/pyproject.toml`
- `README.md` → `{{cookiecutter.project_name}}/README.md`
- `.pre-commit-config.yaml` → `{{cookiecutter.project_name}}/.pre-commit-config.yaml`

## GitHub Workflows
- `ci.yml` → `{{cookiecutter.project_name}}/.github/workflows/ci.yml`
- `docs.yml` → `{{cookiecutter.project_name}}/.github/workflows/docs.yml`

## Package Files
- `__init__.py` content → `{{cookiecutter.project_name}}/{{cookiecutter.package_name}}/__init__.py`
- `core.py` content → `{{cookiecutter.project_name}}/{{cookiecutter.package_name}}/core.py`
- `cli.py` content → `{{cookiecutter.project_name}}/{{cookiecutter.package_name}}/cli.py`

## Test Files  
- `conftest.py` content → `{{cookiecutter.project_name}}/tests/conftest.py`
- `test_*.py` content → `{{cookiecutter.project_name}}/tests/test_{{cookiecutter.package_name}}.py`

## Additional Files to Create
You'll also want to create:
- `{{cookiecutter.project_name}}/.gitignore` (standard Python .gitignore)
- `{{cookiecutter.project_name}}/CHANGELOG.md` (basic changelog template)
- `{{cookiecutter.project_name}}/LICENSE` (license template)
EOF

echo "✅ Template structure created successfully!"
echo ""
echo "📂 Directory structure:"
tree cookiecutter-conda-python 2>/dev/null || find cookiecutter-conda-python -type d | sed 's/[^-][^\/]*\//  /g' | sed 's/^  //' | sed 's/--/├──/' | sed 's/  /│  /g'
echo ""
echo "📋 Next steps:"
echo "1. Copy the artifact contents to the appropriate files (see FILE_MAP.md)"
echo "2. Test the template with: cookiecutter cookiecutter-conda-python"
echo "3. Example test session:"
echo "   cd /tmp && cookiecutter /path/to/cookiecutter-conda-python"
echo "   # Answer prompts, then:"
echo "   cd your-project && conda env create -f environment-dev.yml"
echo "   conda activate your-project-dev && pip install -e . && pytest"
echo ""
echo "🎉 Happy templating!"

# Make sure we're back in the original directory
cd "$(dirname "$0")"