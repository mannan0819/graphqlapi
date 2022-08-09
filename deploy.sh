#!/bin/bash

echo What should the version be?
read VERSION

docker build -t maarain/graphqlapi:$VERSION .
docker push maarain/graphqlapi:$VERSION
ssh root@167.172.146.119 "docker pull maarain/graphqlapi:$VERSION && docker tag maarain/graphqlapi:$VERSION dokku/app:$VERSION && dokku deploy app $VERSION"