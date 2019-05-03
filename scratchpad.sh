#!/bin/zsh

DDOG_API=foo
CLUSTER_TOKEN=bar

# Build base cluster
minikube start -p ultra
kubectl create ns dev # for services
kubectl create ns telemetry # for monitoring & support
kubectl create secret generic datadog-api --from-literal=token="${DDOG_API}"

# Deploy base agent image with clustering
# TODO: Generate token into secrets bucket, manage with CM
helm init # installs to kube-system w/o fancy RBAC
helm install --name ultra-datadog \
    --set datadog.apiKey="${DDOG_API}" \
    --set datadog.appKey="${DDOG_API}" \
    --set clusterAgent.token="${CLUSTER_TOKEN}" \
    --set clusterAgent.enabled=true \
    --set clusterAgent.metricsProvider.enabled=true \
    --namespace telemetry \
    stable/datadog

# Upgrade it with bespoke config
helm upgrade -f ./base-datadog-agent/values.yaml ultra-datadog --namespace telemetry stable/datadog