#!/bin/bash

# Step 1: Create the start script
cat <<EOL > start
#!/bin/bash
python3 Assistant/main.py
EOL

# Make the start script executable
chmod +x start

# Step 2: Create the Dockerfile
cat <<EOL > Dockerfile
FROM python:3.9-slim

WORKDIR /usr/src/app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 80

CMD ["bash", "start"]
EOL

# Step 3: Build the Docker image
docker build -t AsistentBot .

# Step 4: Run the Docker container
docker run -d AsistentBot
