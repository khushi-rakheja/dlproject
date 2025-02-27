# Use an official Python image (modify the version as needed)
FROM python:3.10-slim

# Set environment variables
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install system dependencies
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv \
    build-essential libssl-dev libffi-dev python3-dev && \
    pip install --upgrade pip

# Copy application files
COPY . /app
WORKDIR /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Command to run the application
CMD ["python", "app.py"]  # Change this if your entry file is different
