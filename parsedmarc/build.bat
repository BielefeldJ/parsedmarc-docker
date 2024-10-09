@echo off

echo "Apply temprary fix for buildimg arm64 image"
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes -c yes

echo "Building parsecmarc Docker Image"

docker buildx build --platform=linux/amd64,linux/arm64 -t bielefeldj/parsedmarc:latest . --push=true

echo "Parsecmarc Docker Image built and pushed to Docker Hub"
pause
