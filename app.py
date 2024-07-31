"""Main entry point for the application."""

from __future__ import annotations

import functools

from flask import Flask, Response, jsonify, request
from prometheus_client import Counter, Summary, make_wsgi_app
from werkzeug.exceptions import HTTPException
from werkzeug.middleware.dispatcher import DispatcherMiddleware
from werkzeug.middleware.proxy_fix import ProxyFix

REQUESTS = Counter(
    "http_requests_total",
    "Count of HTTP requests made to the app at the given endpoint",
    ["method", "endpoint", "status"],
)
REQUEST_TIMER = Summary(
    "request_latency_seconds",
    "Time spent processing requests",
)


def track_request(func: callable) -> callable:
    """Implement wrapper for prometheus."""

    @functools.wraps(func)
    def wrapper(*args: tuple, **kwargs: dict) -> Response:
        response = func(*args, **kwargs)
        REQUESTS.labels(
            method=request.method,
            endpoint=request.path,
            status=response.status_code,
        ).inc()

        return response

    return wrapper


def handle_exception(error: HTTPException) -> tuple[Response, int]:
    """Handle all exceptions."""
    return jsonify(error=str(error.description)), 404


def create_app(app_config: dict | None = None) -> Flask:
    """Create and configure an instance of the Flask application."""
    app = Flask(__name__)

    app.wsgi_app = ProxyFix(
        app.wsgi_app,
        x_for=1,
        x_proto=1,
        x_host=1,
        x_prefix=1,
    )
    app.config.from_prefixed_env()

    app.register_error_handler(HTTPException, handle_exception)

    app.config.from_mapping(app_config)

    app.wsgi_app = DispatcherMiddleware(
        app.wsgi_app,
        {"/metrics": make_wsgi_app()},
    )
    return app


APP = create_app()


@APP.get("/")
@REQUEST_TIMER.time()
@track_request
def submit() -> Response:
    """Route for the application."""
    return jsonify({"data": "dummy"})
