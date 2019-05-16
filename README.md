# mk-ultra

![mk-ultra icon](https://static.thenounproject.com/png/506728-200.png)

Just a place to collect all my Minikube builds.

Let's see what we got here...

## datadog

This is what is in the works right now. Goal is to figure out:

1. How to use the current stable Helm chart to grok the logs and metrics associated with an opinionated k8s setup.
2. How to build charts or other deployables that can be used to deploy and persist monitors and dashboard artifacts.
3. How to build charts or other deployables that can handle account configuration and SAML in a multiaccount buildout.

As of latest commit, Helm values work for POC, but require some templating for NodeSelection and the like. Manifests lack confd settings.