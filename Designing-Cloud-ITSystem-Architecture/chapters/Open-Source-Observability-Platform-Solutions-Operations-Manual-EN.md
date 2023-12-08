# Overview

This solution utilizes open-source tools like ClickHouse, Neo4j, VectorDB, PromQL, LogQL, OpenTracing, Prometheus, Grafana, AlertManager, and DeepFlow. The open-source observability platform solution is automatically delivered via GitHub Actions to create services.

# Observability Platform Operations

After completing the platform installation and deployment (for details, refer to the previous article: [https://cloud.tencent.com/developer/article/2363793](https://cloud.tencent.com/developer/article/2363793)), log in to the console. Configuring the onwalk.net domain as an example:

- Grafana Dashboard: For example, log in to [https://grafana.onwalk.net](https://grafana.onwalk.net) with the default username: admin and password: deepflow.
- Prometheus Page, accessible at [https://prometheus.onwalk.net](https://prometheus.onwalk.net) without a password.
- Alertmanager Page, accessible at [https://alertmanager.onwalk.net](https://alertmanager.onwalk.net) without a password.

# Tutorial

## Configuring Data Sources

For example, at [https://grafana.onwalk.net](https://grafana.onwalk.net), log in as an admin, then go to Data Sources -> Add new data sources.

1. Add metric data sources.
2. Add log data sources.
3. Add other data sources.
Depending on the specific application service used, select the corresponding data source type for integration.

## Viewing Metrics

Grafana Explore integrates with Prometheus data sources, allowing users to quickly identify and solve problems. To view Prometheus data through Explore, follow these steps:

Add the Prometheus data source in Grafana, entering the address and access credentials for Prometheus. Open Grafana Explore, select the Prometheus data source, and enter a query.

## Viewing Logs

Grafana Explore integrates with Loki data sources for quick problem resolution. To view Loki logs through Explore, follow these steps: Add the Loki data source in Grafana, entering the address and access credentials. Open Grafana Explore, select the Loki data source, and enter a query.

## Importing Custom Dashboards

For example, using the sample Dashboard available at [https://github.com/svc-design/ObservabilityServer/tree/main/example/dashboard](https://github.com/svc-design/ObservabilityServer/tree/main/example/dashboard):

Select the Dashboard JSON template file, choose the corresponding data source. After importing the Dashboard, visualization charts displayed from the Prometheus data source are visible, including those for Node Exporter and kube-state-metrics.

Grafana's community offers many dashboards at [https://grafana.com/grafana/dashboards/?pg=hp&plcmt=lt-box-dashboards](https://grafana.com/grafana/dashboards/?pg=hp&plcmt=lt-box-dashboards), which can be selected as needed.

# Alert Rule Configuration Management

In a Kubernetes (k8s) cluster, Prometheus is deployed, and the configuration files for alert rules are stored in Kubernetes ConfigMaps. To make changes to alert rules, refer to the following commands:

## Configuring Recording Rules

Recording rules are used to define configurations for new time series data. They can calculate new metrics from existing time series data and store them as new time series data. The recording rules configuration file contains the following information:

- Name and labels for the new time series data: For example, the name of the new metric is "http\_requests\_total," and it has labels like "method" and "status."
- Expression to calculate the new metric: For example, the expression to calculate the total HTTP requests is "sum(http\_requests\_total)."
- Sampling frequency and storage strategy for the new time series data: For example, you can sample every 15 seconds and retain the data for 7 days.

To modify alert rules, execute the following command:

```
kubectl get cm observability-server-prometheus-server -n monitoring
```

Below is a basic example of a Prometheus recording\_rules configuration used to monitor host load, CPU usage, memory usage, and disk usage.

```yaml
data:
  recording_rules.yml: |
    groups:
    - name: host-monitoring
      rules:
      - record: node_load1
        expr: node_load1
      - record: node_cpu_usage
        expr: 100 - (avg by (instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)
      - record: node_memory_usage
        expr: (node_memory_MemTotal_bytes - node_memory_MemFree_bytes - node_memory_Buffers_bytes - node_memory_Cached_bytes) / node_memory_MemTotal_bytes * 100
      - record: node_disk_usage
        expr: 100 - (avg by (instance) (node_filesystem_avail_bytes{fstype="ext4"} / node_filesystem_size_bytes{fstype="ext4"}) * 100)
```

This configuration example includes a rule group named "host-monitoring" containing four recording rules used to calculate host load, CPU usage, memory usage, and disk usage.

- node\_load1: Calculates the host's load, which is a built-in Prometheus metric.
- node\_cpu\_usage: Computes CPU usage using the irate function to calculate the rate of change of CPU usage, followed by averaging with the avg function, and finally transforming the result into a percentage using mathematical operations.
- node\_memory\_usage: Determines memory usage, utilizing the node\_memory\* metrics to calculate the available memory as a percentage.
- node\_disk\_usage: Calculates disk usage, employing the nodefilesystem\* metrics to compute available disk space as a percentage.

These recording rules can be queried through Prometheus's web UI or API and can be used for creating alert rules or generating dashboards.

## Configuring alerting\_rules

alerting\_rules is a configuration file used to define alerting rules. It allows you to trigger alerts based on the values of time series data or other conditions and send notifications to administrators or relevant personnel. The alerting\_rules configuration file contains the following information:

- Conditions that trigger alerts, such as exceeding a threshold for CPU usage, low disk space, and so on.
- Alert levels and labels, such as warning, critical, urgent, and labels indicating the source and target of the alert.
- Methods for alert notifications, such as sending emails, SMS messages, Slack notifications, and more.

Here is an example of configuring Alerting Rules for monitoring targets like host load, CPU usage, memory usage, and disk usage:

To modify the alerting rules, execute the following command:

```bash
kubectl get cm observability-server-prometheus-server -n monitoring
```

This command retrieves the ConfigMap named "observability-server-prometheus-server" in the "monitoring" namespace, which contains the alerting rules configuration.

1.Host Load Alerting Example

```yaml
data:
  alerting_rules.yml: |
    groups:
      - name: host-monitoring
        rules:
          - alert: HighLoad
            expr: node_load1 > 2.0 for: 5m
            labels:
              severity: warning
            annotations:
              summary: High load on {{ $labels.instance }}
              description: "Load is {{ $value }} (threshold: 2.0)"
```

Configuration Explanation:

This example defines an alerting rule group named "host-monitoring," which contains 1 alerting rule.

- HighLoad: Triggers an alert when the 1-minute average load exceeds 2.0.
The alert rule definition includes the following information: alert name, trigger condition, duration, labels, and annotations.
- The trigger condition for the HighLoad rule is node\_load1 > 2.0,     indicating that the current host's average load is above 2.0.
- It triggers an alert if the condition persists for 5 minutes.
The label "severity" is set to "warning," indicating that the alert severity is warning.
- The annotation "summary" is set to "High load on {{ $labels.instance }}, indicating that the alert summary is "High load on instance name."
- The description provides additional information about the alert, stating, "Load is {{ $value }} (threshold: 2.0)."

2.CPU Usage Alerting Example

```
data:
  alerting_rules.yml: |
    groups:
      - name: host-monitoring
        rules:
          - alert: HighCpuUsage
            expr: 100 - (avg by (instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100) > 90 for: 5m
            labels:
              severity: critical
            annotations:
              summary: High CPU usage on {{ $labels.instance }}
              description: "CPU usage is {{ $value }}%"
```

Configuration Explanation:

This example defines an alerting rule group named "host-monitoring," which contains 1 alerting rule.

- HighCpuUsage: Triggers an alert when the 1-minute average CPU usage exceeds 90%.
The alert rule definition includes the following information: alert name, trigger condition, duration, labels, and annotations.
- The trigger condition for the HighCpuUsage rule is "HighCpuUsage > 90%."
It triggers an alert if the condition persists for 5 minutes.
- The label "severity" is set to "critical," indicating that the alert severity is critical.
- The annotation "summary" is set to "High CPU usage on {{ $labels.instance }}," providing a summary of the alert.
- The description provides additional information about the alert, stating, "CPU usage is {{ $value }}%."

3.Memory Usage Alerting Example

```yaml
data:
  alerting_rules.yml: |
    groups:
      - name: host-monitoring
        rules:
          - alert: HighMemoryUsage
            expr: (node_memory_MemTotal_bytes - node_memory_MemFree_bytes - node_memory_Buffers_bytes - node_memory_Cached_bytes) / node_memory_MemTotal_bytes * 100 > 90
            for: 5m
            labels:
              severity: warning
            annotations:
              summary: High memory usage on {{ $labels.instance }}
              description: "Memory usage is {{ $value }}%"
```

This example defines an alerting rule group named "host-monitoring," which contains 1 alerting rule.

- HighMemoryUsage: Triggers an alert when the host's memory usage exceeds 90%.
The alert rule definition includes the following information: alert name, trigger condition, duration, labels, and annotations.
- The alert rule is named "HighMemoryUsage."
- The trigger condition is "HighMemoryUsage > 90%," and it triggers an alert if the condition persists for 5 minutes.
- The label "severity" is set to "warning," indicating that the alert severity is warning.
- The annotation "summary" is set to "High memory usage on {{ $labels.instance }}," providing a summary of the alert.
- The description provides additional information about the alert, stating, "Memory usage is {{ $value }}%."

4.Disk Usage Alerting Example

```
data:
  alerting_rules.yml: |
    groups:
      - name: host-monitoring
        rules:
          - alert: HighDiskUsage
            expr: node_filesystem_avail_bytes{fstype="ext4"} / node_filesystem_size_bytes{fstype="ext4"} * 100 < 10
            for: 5m
            labels:
              severity: critical
            annotations:
              summary: High disk usage on {{ $labels.instance }}
              description: "Disk usage is {{ $value }}%"
```

Configuration Explanation:

This example defines an alerting rule group named "host-monitoring," which contains 1 alerting rule.

- HighDiskUsage: Triggers an alert when the host's disk usage falls below 10%.
The alert rule definition includes the following information: alert name, trigger condition, duration, labels, and annotations.
- The alert rule is named "HighDiskUsage."
- The trigger condition is "HighDiskUsage < 10%," and it triggers an alert if the condition persists for 5 minutes.
- The label "severity" is set to "critical," indicating that the alert severity is critical.
- The annotation "summary" is set to "High disk usage on {{ $labels.instance }}," providing a summary of the alert.
- The description provides additional information about the alert, stating, "Disk usage is {{ $value }}%."

Viewing Active Alerting Rules and Their Status in Prometheus

In Prometheus, you can check the current active alerting rules and their status on a dedicated page. On this page, you can see information for each alerting rule, including its name, status, labels, summary, and more. You can also use a search box to find specific alerting rules. By reviewing this page, you can confirm whether Prometheus Alerting Rules are working correctly and which alerting rules are currently active.

## Configuring Alert Notifications

Alertmanager is a standalone component within the Prometheus ecosystem that handles and routes alert notifications. Alertmanager can work alongside Prometheus to send alert notifications to various receivers such as email, Slack, PagerDuty, and supports advanced features like suppression, grouping, and silencing alerts.

## Configuring Alerts in Prometheus

Prometheus alerting and recording rules are associated with Alertmanager, and you need to specify the address and port of Alertmanager in the Prometheus configuration file. You also set the alertmanager\_config field in the alerting rules to ensure that alert notifications are correctly routed to Alertmanager.

Here's an example of specifying the Alertmanager address and port in the Prometheus configuration file to send alert notifications to alertmanager.onwalk.net:

```yaml
alerting:
  alertmanagers:
    follow_redirects: true
    enable_http2: true
    scheme: http
    timeout: 10s
    api_version: v2
    static_configs:
    - targets:
      - alertmanager.onwalk.net
```

## Configuring Alerting in Alertmanager

Communication between Alertmanager and Prometheus is done over HTTP. When Prometheus detects a new alert, it sends an HTTP POST request to Alertmanager, forwarding the alert information. Alertmanager processes the received alert notifications and, based on the configuration file, sends them to the appropriate receivers. Here's a reference configuration for Alertmanager:

```yaml
route:
  receiver: default-receiver
  continue: false
  group_wait: 10s
  group_interval: 5m
  repeat_interval: 1h

receivers:
- name: default-receiver
  email_configs:
  - to: 'admin@example.com'
    from: 'alertmanager@example.com'
    smarthost: smtp.gmail.com:587
    auth_username: 'alertmanager@example.com'
    auth_identity: 'alertmanager@example.com'
    auth_password: 'password'
```

Make sure that Prometheus and Alertmanager are running, and that alerting rules and routing rules are correctly configured. When Prometheus triggers an alert, Alertmanager will receive the alert notification and forward it to the specified receiver. Alertmanager can also be configured to use third-party plugins for other types of receivers such as WeChat, DingTalk, AWS SNS, etc. Configure as needed and specify how to route alert notifications to different receivers in your routing rules.

# References

- Grafana Documentation: [https://grafana.com/docs/grafana/latest/](https://grafana.com/docs/grafana/latest/)
- Prometheus Documentation: [https://prometheus.io/docs/](https://prometheus.io/docs/)
- DeepFlow Documentation: [https://deepflow.io/docs/zh/](https://deepflow.io/docs/zh/)
- Loki Documentation: [https://grafana.com/docs/loki/latest/](https://grafana.com/docs/loki/latest/)
- ClickHouse Documentation: [https://clickhouse.tech/docs/en/](https://clickhouse.tech/docs/en/)
- Qryn Documentation: [https://qryn.metrico.in/#/introduction](https://qryn.metrico.in/#/introduction)
- Alertmanager Documentation: [https://prometheus.io/docs/alerting/alertmanager/](https://prometheus.io/docs/alerting/alertmanager/)
- ObservabilityServer: [https://github.com/svc-design/ObservabilityServer](https://github.com/svc-design/ObservabilityServer)
- ObservabilityAgent: [https://github.com/svc-design/ObservabilityAgent](https://github.com/svc-design/ObservabilityAgent)
