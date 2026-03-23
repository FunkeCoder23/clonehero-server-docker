#!/usr/bin/bash
test  $1 = "--force" && FORCE=true || FORCE=false

DOCKER_IMAGE=ghcr.io/funkecoder23/clonehero-server-docker

TEMPDIR=$(mktemp -d -p .)

git clone --depth 1 --branch main https://github.com/clonehero-game/releases.git $TEMPDIR
pushd $TEMPDIR

for VER in $(git tag -l | grep -e v\d*); do
    echo ""
    docker pull $DOCKER_IMAGE:$VER && ! $FORCE && continue
    pushd ../Docker
    echo "Building and pushing $DOCKER_IMAGE:$VER"
	docker build . \
        --build-arg CH_VERSION=$VER \
        -t $DOCKER_IMAGE:$VER
    docker push $DOCKER_IMAGE:$VER
    popd
done
popd
echo -e "\nPushing $VER as latest"
docker tag $DOCKER_IMAGE:$VER $DOCKER_IMAGE:latest
docker push $DOCKER_IMAGE:latest

rm -rf $TEMPDIR