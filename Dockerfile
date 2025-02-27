# Use a full-featured Python base image
FROM python:3.10-slim

# Set environment variables
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install dependencies
RUN apt-get update && apt-get install -y python3-pip python3-venv && \
    pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . /app
WORKDIR /app

# Run the application
CMD ["python", "app.py"]  # Change "app.py" to your actual entry point
