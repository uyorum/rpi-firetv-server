.PHONY: all

VERSION := 1.0.5

image:
        docker build -t uyorum/rpi-firetv-server:${VERSION} --build-arg version=${VERSION} .

push:
        docker push uyorum/rpi-firetv-server:${VERSION}
