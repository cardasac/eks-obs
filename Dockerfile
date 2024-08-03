FROM public.ecr.aws/docker/library/python:3.12-slim AS base

WORKDIR /app
COPY pyproject.toml poetry.lock ./

RUN apt-get update && apt-get install -y --no-install-recommends curl && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV POETRY_HOME="/opt/poetry" \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_VIRTUALENVS_IN_PROJECT=false \
    POETRY_NO_INTERACTION=1 \
    PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1

ENV PATH="$PATH:$POETRY_HOME/bin"

RUN curl -sSL https://install.python-poetry.org | python - && poetry install --no-root

FROM base AS serve
WORKDIR /app
COPY app.py gunicorn.conf.py ./

RUN groupadd nonroot && useradd nonroot -g nonroot
USER nonroot

HEALTHCHECK --interval=5s --timeout=3s \
    CMD curl -f http://localhost:8080 || exit 1

CMD ["poetry", "run", "gunicorn", "app:APP", "--workers", "4", "-c", "gunicorn.conf.py", "--bind", "0.0.0.0:8080"]
