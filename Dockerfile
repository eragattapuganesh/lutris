# Use an official Ubuntu image
FROM ubuntu:22.04

# Install dependencies (example)
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy all files into container
COPY . .

# Default command
CMD ["bash"]
