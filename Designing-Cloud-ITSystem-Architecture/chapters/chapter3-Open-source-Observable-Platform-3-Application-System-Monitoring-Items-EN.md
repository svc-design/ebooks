# Overview

When discussing monitoring and alerting from a container application perspective, there are several key points to consider. Traditional host-based monitoring approaches, such as utilization and load monitoring, may no longer be suitable in a dynamic, multi-replica Pod environment. This is due to the dynamic nature and elasticity of application services in containerized and microservices architectures.

API Service Level Objectives (SLOs): Monitoring and alerting systems should focus more on API Service Level Objectives (SLOs). This includes, but is not limited to, response time, availability, and error rates. This approach better reflects the user experience and business objectives.

Pod Performance Metrics: Instead of focusing on the resource usage of the entire host, focus on specific performance metrics of Pods, such as restart counts, latency, and traffic. This helps in quickly identifying and resolving issues specific to a service.

Resource Availability Forecasting and Alerting: Host nodes should be viewed as resource pools, where forecasting the availability of resources becomes crucial. By predicting resource shortages, scaling up or optimizing can be done in time to avoid service disruptions.

Automation and Intelligence: As container technologies and microservices evolve, monitoring and alerting systems should also move towards automation and intelligence. For example, using machine learning algorithms to predict and identify abnormal behavior patterns.

Multi-Dimensional Data Aggregation: Combining data from different sources (such as application logs, performance metrics, network traffic, etc.) for multi-dimensional analysis provides a more comprehensive perspective.

Service Dependency Analysis: Understanding the dependencies between services is crucial for accurate monitoring and troubleshooting.

Utilizing open-source monitoring tools such as Prometheus, Alertmanager, Loki, and Grafana for monitoring Service Level Objectives (SLOs) of infrastructure and application resource consumption. This approach also involves unifying the handling of monitoring metrics, logs, and link tracing, as well as reducing ineffective alerts. Below is a solution concept and configuration example based on the S.T.A.R. (Situation, Task, Action, Result) methodology:

## Situation

The organization requires monitoring of infrastructure and application resource consumption.

There is a need to unify the handling of monitoring metrics, logs, and link tracing, as well as the alert system.

## Task

To implement comprehensive monitoring of infrastructure and applications.

To reduce ineffective alerts while ensuring SLOs are met.

## Action

**Prometheus and Alertmanager Configuration:**

- Utilize Prometheus for monitoring infrastructure and application metrics.
- Manage alerts with Alertmanager, configuring rules to match specific metric anomalies.

**Loki Configuration:**

- Collect and manage log data.
- Write queries using LogQL and integrate with Grafana for log display.

**Grafana Configuration:**

- Add data sources from Prometheus and Loki to Grafana.
- Create dashboards for visualizing metrics and logs.
- Utilize Grafana's alerting features for improved alert management.

**Link Tracing:**

- Integrate an appropriate link tracing system (such as Jaeger).
- Ensure link data is combined with Prometheus and Grafana.

**Alert Optimization:**

- Analyze historical alert data to identify and adjust frequent and ineffective alerts.
- Refine alert conditions using PromQL and other query languages.

## Result

- Achieved comprehensive monitoring of infrastructure and applications.
- Effectively reduced ineffective alerts, enhancing operational efficiency.
- Improved system stability and reliability.

## System Resource Usage

- Load
- CPU Usage
- Memory Usage
- Disk I/O
- Network I/O

# Business Application Monitoring Summary and Comparison

| Type                | Resource Consumption | Performance Metrics     | Log Monitoring      | Business Metrics    | Special Considerations            |
|:----|:----|:----|:----|:----|:----|
| Frontend Application | Browser Performance (CPU, Memory) | Page Load Time, FCP, CLS | Frontend Errors, User Behavior | User-Related Metrics | User Experience Metrics (FID, LCP) |
| Java Backend Service | CPU, Memory, I/O       | Response Time, Throughput | Application Logs, Error Tracking | API Calls, Transactions | JVM Metrics (GC, Heap Usage)       |
| Go Backend Service   | CPU, Memory, I/O       | Response Time, Throughput | Application Logs, Error Tracking | API Calls, Transactions | Go Goroutine Count, GC Metrics    |
| Python Backend Service | CPU, Memory, I/O     | Response Time, Throughput | Application Logs, Error Tracking | API Calls, Transactions | GIL Lock Contention, Python-Specific Metrics |
| Cache Middleware     | CPU, Memory, Network   | Command Throughput, Latency | Access Logs, Error Logs | Cache Hit Rate, Key-Space Stats | Persistence Latency, Replication Latency |
| Message Queue        | CPU, Memory, Network   | Message Throughput, Latency | Service Logs, Error Logs | Queue Length, Message Backlog | Partition Status, Consumer Lag     |
| Relational Database  | CPU, Memory, Disk I/O  | Query Throughput, Response Time | Query Logs, Error Logs | Transaction Volume, Slow Queries | Lock Waits, Replication Delay, Buffer Pool Hit Rate |
| NoSQL Database       | CPU, Memory, Network   | Read/Write Throughput, Response Time | Operation Logs, Error Logs | Data Size, Access Patterns | Distributed Health, Partition Status, Data Replication |


When monitoring non-relational databases (such as MongoDB, Redis, Cassandra, etc.), it is essential to pay special attention to their unique architectures and usage patterns. This includes monitoring the health of distributed clusters, data replication status, and responses to specific access patterns. This supplementary entry covers the primary monitoring aspects of non-relational databases, ensuring their high performance and reliability.
