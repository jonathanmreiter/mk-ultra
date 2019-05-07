# Use Cases

1. Given versionable ruleset for alerts (Helm charts), compose into alert (within CI/CD pipeline)
2. Alerts should emit to PagerDuty and Slack
3. Alerts should have tolerances that can be modified, QA'd, and deployed in minutes
4. Alerts should have analytical views that are mobile friendly
5. Alerts should be composable with playbooks or runbooks that are versioned, and can convert to automated response
6. Alert silencing should be automated
7. Alert severity should be smoothed based on meta alert properties

## 1. Creating a Monitor
`POST https://api.datadoghq.com/api/v1/monitor` will do this, with query JSON embedded. The query JSON can be exported from the UI, and can be retrieved based on `GET https://api.datadoghq.com/api/v1/monitor/search`

## 2. Monitor Integrations
https://docs.datadoghq.com/integrations/pagerduty/
https://docs.datadoghq.com/integrations/slack/

Monitor notifications can trigger PagerDuty and/or go to configured Slack Channels. Services can be reconfigured via `https://api.datadoghq.com/api/v1/integration/(pagerduty|slack)`

## 3. Alert Lifecycle
`PUT https://api.datadoghq.com/api/v1/monitor/<MONITOR_ID>` can handle this, and the versionable elements are just JSON elements.

## 4. Alert Presentation
Relevant dashboard elements will be autopopulated. Same with recovery events. You can also override this by linking to HostMaps or any other presentation URI that is relevant.

## 5. Manual and Automated Response
External links or response text is common to be included in notifications. Additionally, there are predictive monitors, and support for webhooks for potentially automated response or next steps.

The cases that developers thought to be important to capture:

* Comparison of prediction/probability intervals
  * How much does the median of the last 90s deviate from the median of the last 90m?
  * This is useful for correlating failures or far-reaching network partitions
* Anomaly Detection or Forecasting
  * Probably useful for correlating cuuids across PATHs
  * Devs want access to refine these requirements

## 6. Silencing
`POST https://api.datadoghq.com/api/v1/downtime` is a key feature.

## 7. Smoothing Alert Fanout
Developers noted that alerting should have a meta-estimator. We know (x) alerted (y) times, and that is not sufficient to escalate. 

We should look at alert recovery predicates as a means to achieve this. Recovery is a state scoped above a single alert trigger. It would be useful for tuning tolerances such to promote auto response or to avoid escalation.

## Observed Gaps
None so far.