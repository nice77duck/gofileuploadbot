# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV PYTHONUNBUFFERED 1

# Create and set the working directory
RUN mkdir /workdir
WORKDIR /workdir

# Copy the requirements file into the container
COPY requirements.txt /workdir/

# Upgrade pip and install dependencies
RUN pip install --upgrade pip wheel
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container
COPY . /workdir/

# Command to run the application
CMD ["python", "main.py"]
