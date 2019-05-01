#!/bin/zsh

minikube start -p ultra
kubectl create secret generic datadog-api --from-literal=token="{$DDOG_API}"
# kubectl get secrets

