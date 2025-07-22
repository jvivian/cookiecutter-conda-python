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
