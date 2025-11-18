FROM debian:12

# Set environment variables to avoid interactive prompts during package installations
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install necessary packages, including Git
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    cmake \
    libdrm-dev \
    libsdl2-dev \
    libsdl2-image-dev \
    alsa-tools \
    mosquitto \
    mosquitto-dev \
    mosquitto-clients \
    libmosquitto1 \
    libmosquittopp1 \
    libmosquitto-dev \
    wayland-protocols \
    build-essential \
    ca-certificates \
    curl \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    libevdev-dev
 
RUN pip3 install virtualenv && virtualenv venv

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libglfw3 \ 
    libglfw3-dev \
    libglew-dev \
    libgl1-mesa-dev

# Verify that GCC, G++, and CMake are installed
RUN gcc --version && g++ --version && cmake --version

CMD ["/app/scripts/build_app.sh"]