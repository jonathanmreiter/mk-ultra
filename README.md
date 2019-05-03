# mk-ultra

Just a place to collect all my Minikube builds.

Let's see what we got here...

## datadog

This is what is in the works right now. Goal is to figure out:

1. How to use the current stable Helm chart to grok the logs and metrics associated with an opinionated k8s setup.
2. How to build charts or other deployables that can be used to deploy and persist monitors and dashboard artifacts.
3. How to build charts or other deployables that can handle account configuration and SAML in a multiaccount buildout.

## vitess

Hey, why not? This is the beginnings of some work on globally available multitenant databasing. Vitess is shard master go service + etcd + MySQL.

Some goals here:
1. Can I leverage namespaces to handle data classification shards?
2. What is the ideal multi-cluster setup (i.e. to cater to multiregional infrastructure provider, or multicloud)
