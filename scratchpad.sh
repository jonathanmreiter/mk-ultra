#!/bin/zsh

# Build base cluster
minikube start -p ultra
kubectl create ns telemetry

# Deploy base agent image with clustering
# TODO: Generate token into secrets bucket, manage with CM
helm init # installs to kube-system w/o fancy RBAC
helm install --name datadog-monitoring \
    --set datadog.apiKey="${DDOG_API}" \
    --set datadog.appKey="${DDOG_API}" \
    --set clusterAgent.enabled=true \
    --set clusterAgent.metricsProvider.enabled=true \
    stable/datadog
