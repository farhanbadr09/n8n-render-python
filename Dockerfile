# Use the official n8n image as base
FROM n8nio/n8n:latest

# Install Python, pip, build tools, and dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    jpeg-dev \
    zlib-dev \
    libffi-dev

# Create a virtual environment for Python packages
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Upgrade pip inside venv
RUN pip install --upgrade pip

# Install Python packages inside the virtual environment
RUN pip install --no-cache-dir numpy opencv-python-headless

# Set working directory (optional, keeps it clean)
WORKDIR /home/n8n

# Copy entrypoint (optional, keeps original n8n entrypoint)
ENTRYPOINT [ "tini", "--", "/bin/sh", "-c", "n8n" ]
