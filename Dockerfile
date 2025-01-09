# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set environment to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages: git, curl, and Node.js
RUN apt-get update && apt-get install -y \
    git \
    curl \
    gnupg \
    build-essential \
    git \
    nano \
    && apt-get clean

# Install Node.js 22.x
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
RUN apt-get install -y nodejs

RUN node -v && npm -v

# Install PM2 globally
RUN npm install -g pm2

# Create a non-root user named 'docker' with sudo access
RUN useradd -ms /bin/bash docker \
    && echo "docker:docker" | chpasswd \
    && usermod -aG sudo docker

# Switch to the 'docker' user
USER docker

# Set working directory
WORKDIR /home/docker

# Clone the repository
RUN git clone https://github.com/Richieleonardo/chat-TST

# Install the app dependencies
WORKDIR /home/docker/chat-TST
RUN npm install

# Expose the port your app is listening on
EXPOSE 8072

# Command to start the app using PM2
CMD ["pm2-runtime", "start", "app.js"]
