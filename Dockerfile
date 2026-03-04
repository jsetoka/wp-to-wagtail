FROM python:3.12-slim

WORKDIR /app/config
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential ca-certificates curl gcc \
    libpq-dev libxml2-dev libxslt1-dev zlib1g-dev \
    libffi-dev libssl-dev python3-dev \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip wheel setuptools \
 && pip install --no-cache-dir -r /app/requirements.txt

CMD ["bash", "-lc", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]