set -e
clear
docker stop dev-network || true
docker stop python-dev || true
docker rm python-dev
docker network create -d bridge dev-network || true
DOCKER_BUILDKIT=1 docker build -t python-dev-env -f Dockerfilec.

docker run --name=python-dev \
    -v "$(pwd)/":/root \
    --network=dev-network \
    -e CONTEXT="DEV" \
    -e DB="dbname='dev-network' user='dev' password='password' host='db'" \
    -p 8000:8000 \
    -it python-dev-env /bin/bash