# Use Cases

1. Given versionable ruleset for dashboards (Yaml or JSON), deploy to Datadog as package
2. Access control should be configurable in the ruleset
3. It should be possible to correlate code, environment, and the tags exposed in a service
4. Usage statistics should also be available

## 1. Creating a Dashboard
via `POST https://api.datadoghq.com/api/v1/dashboard`. All dashboards are composed of Widgets, and Widgets are defined by JSON. So not only is this verisonable, reuse of widgets could also be templated in theory.

## 2. Access Control
This isn't possible within a suborganization. You either can see all, or cannot see anything. Perhaps the best approach is to grant users access (which should occur within the context of SAML), and those users who need some views on stuff but not the entire access should be [shared content](https://docs.datadoghq.com/graphing/dashboards/shared_graph/).

You can share content via a revokable key, and embeds can be handled via `GET https://api.datadoghq.com/api/v1/graph/embed/`

There isn't anything designed for data classification or RBAC for logging yet. So this is something to keep in mind.

## 3. Data Governance
TODO: Need visibility into parent-child account definitions

Tagging is visible via `GET https://api.datadoghq.com/api/v1/tags/hosts`, and would have to be configured for all non-auto gen aggregation keys. We'd have to generate capacities to span accounts, however.

## 4. Usage Report Out
Usage through `GET https://api.datadoghq.com/api/v1/usage`, and this should at least define usage of the current account.

We will need capabilities if we want to handle parent-child and log or host metering, however.

## Observed Gaps
Anything tied to data classification and complex parent-child account management will have to be developed or will be handled in a future Datadog release:

* RBAC, and delegation of rights within an account
* Global data governance
* Child account metering