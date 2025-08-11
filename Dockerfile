FROM python:3.9-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PIP_NO_CACHE_DIR=1

WORKDIR /app

COPY flask-app/ .

RUN pip install -r requirements.txt

CMD ["python", "app.py"]
