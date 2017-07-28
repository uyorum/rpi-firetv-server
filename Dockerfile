FROM resin/rpi-raspbian:jessie

RUN apt-get update && \
      apt-get install -y python2.7 python-pip python-setuptools python-yaml libusb-1.0-0 && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/*

ARG version
RUN builddeps="gcc swig libssl-dev python-dev" && \
      apt-get update && \
      apt-get install -y ${builddeps} && \
      pip install flask && \
      pip install https://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-0.24.0.tar.gz && \
      pip install "firetv[firetv-server]==${version}" && \
      apt-get remove -y ${builddeps} && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/*

EXPOSE 5556
CMD ["firetv-server", "-c", "/config/config.yaml"]
