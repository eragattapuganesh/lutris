FROM ubuntu:22.04

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git python3 python3-pip python3-setuptools python3-gi \
    gir1.2-gtk-3.0 gir1.2-webkit2-4.1 build-essential python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Clone Lutris repo
RUN git clone https://github.com/lutris/lutris.git /opt/lutris
WORKDIR /opt/lutris

# Install pip dependencies safely (only if requirements.txt exists)
RUN if [ -f requirements.txt ]; then \
        pip3 install --upgrade pip && pip3 install -r requirements.txt; \
    else \
        echo "No requirements.txt found, skipping pip install"; \
    fi

# Default command
CMD ["python3", "bin/lutris"]
