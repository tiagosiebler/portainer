#!/bin/bash

REPO=$REPO
ACCESS_TOKEN=$ACCESS_TOKEN
ENDPOINT="https://api.github.com/repos/${REPO}/actions/runners/registration-token"

echo "Calling runner registration on ${ENDPOINT}"

# REG_TOKEN=$(curl -sX POST -H "Authorization: token ${ACCESS_TOKEN}" https://api.github.com/orgs/${ORGANIZATION}/actions/runners/registration-token | jq .token --raw-output)
REG_TOKEN=$(curl -sX POST -H "Authorization: token ${ACCESS_TOKEN}" ${ENDPOINT} | jq .token --raw-output)

# echo "Using reg token: ${REG_TOKEN}"

cd /home/docker/actions-runner

./config.sh --url https://github.com/${REPO} --token ${REG_TOKEN}

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${REG_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!
