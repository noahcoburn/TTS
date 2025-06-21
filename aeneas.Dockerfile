FROM ubuntu:18.04

# Ensure the system is up to date
RUN apt-get update && apt-get install -y \
    software-properties-common \
    python2.7 \
    python2.7-dev \
    python-pip \
    git \
    build-essential \
    ffmpeg \
    espeak \
    libsndfile1 \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    curl \
    && apt-get clean

# Symlink python and pip
RUN ln -sf /usr/bin/python2.7 /usr/bin/python && \
    ln -sf /usr/bin/pip /usr/bin/pip2

# Clone aeneas and install
RUN pip2 install numpy==1.16.6
RUN git clone https://github.com/readbeyond/aeneas.git /aeneas
WORKDIR /aeneas
RUN apt-get update && apt-get install -y libespeak-dev
RUN pip2 install .

# Optional: add a default command
CMD ["bash"]
