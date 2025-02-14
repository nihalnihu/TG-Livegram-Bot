# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port your application listens on
EXPOSE 8080

# Define environment variable
ENV PYTHONUNBUFFERED=1

# Copy the start.sh script into the container
COPY start.sh /app/start.sh

# Make the start.sh script executable
RUN chmod +x /app/start.sh

# Run start.sh when the container launches
CMD ["/app/start.sh"]
