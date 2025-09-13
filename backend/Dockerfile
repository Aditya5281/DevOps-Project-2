FROM python:3.11-slim as build
WORKDIR /app
RUN apt update && apt install -y build-essential libpq-dev --no-install-recommends
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip wheel --no-cache-dir -r requirements.txt -w /wheels


FROM python:3.11-slim
WORKDIR /app
COPY --from=build /wheels /wheels
RUN pip install --no-cache /wheels/*
COPY . /app
ENV PYTHONUNBUFFERED=1
ENV DJANGO_SETTINGS_MODULE=project.settings
RUN python manage.py collectstatic --noinput || true
CMD ["gunicorn", "project.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]