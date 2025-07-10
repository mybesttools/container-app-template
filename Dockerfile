# Python runtime
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy content
COPY ./app/. /app

RUN pip install flask

EXPOSE 80

CMD ["python", "app.py"]