# Python runtime
FROM python:3.14.0b4-slim-bullseye

# Set working directory
WORKDIR /app

# Copy content
COPY . /app

RUN pip install flask

EXPOSE 80

CMD ["python", "app.py"]