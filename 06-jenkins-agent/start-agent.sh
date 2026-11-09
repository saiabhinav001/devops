#!/usr/bin/env bash
set -eu
# Set JENKINS_SECRET locally to the secret from your Jenkins node page.
# Set JENKINS_URL to the controller URL; localhost works on the same machine.
: "${JENKINS_SECRET:?Set JENKINS_SECRET to the node secret from Jenkins}"
JENKINS_URL="${JENKINS_URL:-http://localhost:8080/}"
AGENT_NAME="${AGENT_NAME:-slave-1}"
AGENT_WORKDIR="${AGENT_WORKDIR:-$HOME/Jenkins-Agent}"
mkdir -p "$AGENT_WORKDIR"
cd "$AGENT_WORKDIR"
curl -fSL "${JENKINS_URL%/}/jnlpJars/agent.jar" -o agent.jar
exec java -jar agent.jar -url "$JENKINS_URL" -secret "$JENKINS_SECRET" -name "$AGENT_NAME" -webSocket -workDir "$AGENT_WORKDIR"
