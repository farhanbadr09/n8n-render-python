FROM n8nio/n8n:latest

USER root

# Install Python and system dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    jpeg-dev \
    zlib-dev \
    libffi-dev

# Install Python libraries
RUN pip3 install --no-cache-dir \
    numpy \
    opencv-python-headless

USER node
# Install Python & build deps
RUN apk add --no-cache python3 py3-pip build-base jpeg-dev zlib-dev libffi-dev

# Create a virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install Python packages inside the venv
RUN pip install --no-cache-dir numpy opencv-python-headless

