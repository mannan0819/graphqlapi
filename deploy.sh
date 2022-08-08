#!/bin/bash

echo What should the version be?
read VERSION

docker build -t maarain/graphqlapi:1 .
docker push maarain/graphqlapi:$VERSION
ssh root@ip "docker pull maarain/graphqlapi:$VERSION && docker tag maarain/graphqlapi:$VERSION dokku/api:$VERSION && dokku deploy api $VERSION"