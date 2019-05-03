# Use Cases

1. Given versionable ruleset for dashboards (Yaml or JSON), deploy to Datadog as package
2. Access control should be configurable in the ruleset
3. It should be possible to correlate code, environment, and the tags exposed in a service
4. Usage statistics should also be available

## 1. Creating a Dashboard
via `POST https://api.datadoghq.com/api/v1/dashboard`. All dashboards are composed of Widgets, and Widgets are defined by JSON. So not only is this verisonable, reuse of widgets could also be templated in theory.

## 2. Access Control

## 3. Data Governance

## 4. Usage Report Out

## Observed Gaps