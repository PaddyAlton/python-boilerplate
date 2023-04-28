FROM python:3.11-slim

WORKDIR /app

RUN python -m pip install -U pip && pip install pipenv

COPY Pipfile Pipfile
COPY Pipfile.lock Pipfile.lock

RUN pipenv install --system

COPY src src

ENV PYTHONPATH="${PYTHONPATH}:/app"

RUN adduser --disabled-password appuser && chown -R appuser /app
USER appuser

ENTRYPOINT ["python3"]

#CMD ["src/app.py"]
