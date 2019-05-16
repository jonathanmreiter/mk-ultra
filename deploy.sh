# Here's the manifest based approach
kubectl apply -f cluster-agent-rbac.yaml
kubectl apply -f datadog-rbac.yaml
kubectl apply -f dca-secret.yaml
kubectl apply -f datadog-cluster-agent.yaml
kubectl apply -f datadog-agent.yaml

# And now using the stable Helm chart
helm install --name datadog \
    --set datadog.apiKey=foo \
    --set datadog.appKey=bar \
    --set clusterAgent.enabled=true \
    --set clusterAgent.metricsProvider.enabled=true \
    --set clusterAgent.token=baz \
    --namespace telemetry \
    stable/datadog

helm upgrade -f values.yaml datadog --namespace telemetry stable/datadog --recreate-pods