# Start from an Alpine image with Python
FROM python:3.12-alpine

# Install nodejs (needed for n8n) and other dependencies
RUN apk add --no-cache \
    nodejs \
    npm \
    tini \
    bash \
    jpeg-dev \
    zlib-dev \
    libffi-dev \
    build-base

# Install n8n globally
RUN npm install -g n8n

# Set up working directory
WORKDIR /home/n8n

# Expose default n8n port
EXPOSE 5678

# Use tini as entrypoint for signal handling
ENTRYPOINT ["tini", "--"]

# Start n8n
CMD ["n8n"]
