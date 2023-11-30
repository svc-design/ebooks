# 概述


该解决方案使用 ClickHouse、Neo4j、VectorDB、PromQL、LogQL、OpenTracing、Prometheus、Grafana、AlertManager 和 DeepFlow 等开源工具。开源的可观察性平台解决方案通过 GitHub Actions 自动交付创建服务

# 可观测平台运维

完成平台安装部署后（具体参考上一篇：[https://cloud.tencent.com/developer/article/2363793](https://cloud.tencent.com/developer/article/2363793) )登陆控制台，以配置onwalk.net域名为例：

1. Grafana 面板： 以 [https://grafana.onwalk.net](https://grafana.onwalk.net) 为例，输入默认用户名 :admin 密码:deepflow 登陆
2. Prometheus 页面，以 [https://prometheus.onwalk.net](https://prometheus.onwalk.net)  无密码
3. Alertmanger 页面，以 [https://alertmanger.onwalk.net](https://alertmanger.onwalk.net) 无密码

# Tutorial

## 数据源配置

以 [https://grafana.onwalk.net](https://grafana.onwalk.net) 为例, 以 admin 身份登录，data sources -> Add new data sources

- 添加指标数据源
- 添加日志数据源
- 添加其他数据源
可以根据具体应用使用服务，选择对应数据源类型接入

## 查看指标

Grafana Explore 可以与 Prometheus 数据源集成，以便用户快速定位和解决问题。要通过 Explore 查看 Prometheus 数据，可以进行 以下步骤:

在 Grafana 中添加 Prometheus 数据源，输入 Prometheus 的地址和访问凭证等信息。 打开 Grafana Explore，选择 Prometheus 数据源，并输入查询语句

可观测解决方案

## 查看日志

Grafana Explore 可以与 Loki 数据源集成，以便用户快速定位和解决问题。要通过 Explore 查看 Loki 日志，可以进行以下步骤: 在 Grafana 中添加 Loki 数据源，输入 Loki 的地址和访问凭证等信息。

打开 Grafana Explore，选择 Loki 数据源，并输入查询语句

## 导入 自定义Dashboard

以 [https://github.com/svc-design/ObservabilityServer/tree/main/example/dashboard](https://github.com/svc-design/ObservabilityServer/tree/main/example/dashboard) 提供的示例 Dashboard 为例，参考如下:

选择 Dashboard Json 模版文件，选择对应数据源

导入 Dashboard 后可见从 prometheus 数据源展示的可视化图标，以下分别是对应 Node Exportor 和 kube-state-metrics 示例:

[https://grafana.com/grafana/dashboards/?pg=hp&plcmt=lt-box-dashboards](https://grafana.com/grafana/dashboards/?pg=hp&plcmt=lt-box-dashboards) Grafana 社区提供很多的面板，可以根据需要选择，

## 告警规则配置

- 告警规则配置管理
在 k8S 集群中部署 Prometheus，告警规则的配置文件都会存储在 kubernetes 的 ConfigMap 中, 变更告警规则参考如下命令:
- 配置 recording\_rules
recording\_rules 是用于定义新的时间序列数据的配置文件。它可以从已有的时间序列数据中计算出新的指标，并将其存储为新的 时间序列数据。recording\_rules 配置文件中包含以下信息:
 新时间序列数据的名称和标签:例如，新指标的名称为 http\_requests\_total，标签为 method、status 等。  计算新指标的表达式:例如，计算 http 请求总数的表达式为 sum(http\_requests\_total)。
 新时间序列数据的采样频率和存储策略:例如，每 15 秒采样一次，并保存 7 天的数据
  执行命令，修改告警规则:
以下是一个基本的 Prometheus recording\_rules 配置示例，用于监控主机负载、CPU 使用率、内存使用率和磁盘使用率

```
kubectl get cm observability-server-prometheus-server -n monitoring
   
data: recording_rules.yml: |
groups:
- name: host-monitoring
rules:
- record: node_load1
expr: node_load1
- record: node_cpu_usage
expr: 100 - (avg by (instance) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100) - record: node_memory_usage
expr: (node_memory_MemTotal_bytes - node_memory_MemFree_bytes - node_memory_Buffers_bytes - nod e_memory_Cached_bytes) / node_memory_MemTotal_bytes * 100
- record: node_disk_usage
expr: 100 - (avg by (instance) (node_filesystem_avail_bytes{fstype="ext4"} / node_filesystem_size_bytes{fst
ype="ext4"}) * 100)
```

这个配置示例包含一个名为 host-monitoring 的 rule 组，其中包含四个 recording rules，分别用于计算主机的负载、CPU 使用率、内 存使用率和磁盘使用率。

- node\_load1: 计算主机的负载，这是一个内置的 Prometheus 指标。
- node\_cpu\_usage: 计算 CPU 使用率，这个表达式使用 irate 函数计算 CPU 使用率的变化率，然后使用 avg 函数计算平均值，最 后通过一些数学运算将结果转换为百分比形式。
- node_memory\_usage: 计算内存使用率，这个表达式使用 node\_memory_\* 指标计算可用内存的百分比。
- node\_disk\_usage: 计算磁盘使用率，这个表达式使用 
- node_filesystem_\* 指标计算可用磁盘空间的百分比。 这些 recording rules 可以通过 Prometheus 的 web UI 或 API 查询，并且可以用于创建警报规则或生成仪表盘。
- 6.5.3 配置 alerting\_rules

alerting\_rules 是用于定义告警规则的配置文件。它可以根据时间序列数据的值或其他条件触发告警，并发送通知给管理员或其他 相关人员。alerting\_rules 配置文件中包含以下信息:

 触发告警的条件:例如，CPU 使用率超过阈值、磁盘空间不足等。

 告警的级别和标签:例如，警告、严重、紧急等级别，以及告警的来源和目标等标签。  告警通知的方式:例如，发送邮件、短信、Slack 消息等。

以 主机负载，cpu 使用率，内存使用率，磁盘使用率是监控目标 Alerting Rules 配置示例

  执行命令，修改告警规则:

kubectl get cm observability-server-prometheus-server -n monitoring

- 主机负载告警示例

```
data: alerting\_rules.yml: |
groups:
- name: host-monitoring
rules:
- alert: HighLoad
expr: node\_load1 > 2.0 for: 5m
labels:
severity: warning annotations:
summary: High load on {{ $labels.instance }} description: "Load is {{ $value }} (threshold: 2.0)"
```

配置说明:

述示例定义了一个名为 host-monitoring 的告警规则组，包含了 1 个告警规则

HighLoad:当 1 分钟平均负载超过 2.0 时触发告警 告警规则定义中包含如下信息:告警名称、触发条件、持续时间，标签以及注释

- HighLoad 规则的触发条件是 node\_load1 > 2.0，表示当前主机平均负载超过 2.0
 持续时间超过 5 分钟时触发告警;
 标签 severity 的值为 warning，表示告警级别为警告;
 注释 summary 的值为 High load on {{ $labels.instance }}，表示告警摘要为主机负载过高cpu 使用率告警示例

```
data: alerting\_rules.yml: |
groups:
- name: host-monitoring
rules:
- alert: HighCpuUsage
expr: 100 - (avg by (instance) (irate(node\_cpu\_seconds\_total{mode="idle"}[5m])) \* 100) > 90 for: 5m
labels:
severity: critical annotations:
summary: High CPU usage on {{ $labels.instance }} description: "CPU usage is {{ $value }}%"
```

配置说明:

述示例定义了一个名为 host-monitoring 的告警规则组，包含了 1 个告警规则

- HighCpuUsage:当 1 分钟平均负载超过 90% 时触发告警 告警规则定义中包含如下信息:告警名称、触发条件、持续时间，标签以及注释
- HighLoad 规则的触发条件是 HighCpuUsage > 90%
 持续时间超过 5 分钟时触发告警;
 标签 severity 的值为 critical，表示告警级别为严重;
 注释 summary 的值为 CPU usage is {{ $value }}，提供了有关告警的描述和当前 CPU 使用率的信息。
- 内存使用率告警示例

```
data: alerting_rules.yml: |
groups:
- name: host-monitoring
rules:
- alert: HighMemoryUsage
expr: (node_memory_MemTotal_bytes - node_memory_MemFree_bytes - node_memory_Buffers_bytes - nod e_memory_Cached_bytes) / node_memory_MemTotal_bytes * 100 > 90
for: 5m labels:
severity: warning annotations:
summary: High memory usage on {{ $labels.instance }} description: "Memory usage is {{ $value }}%"
```

配置说明:

述示例定义了一个名为 host-monitoring 的告警规则组，包含了 1 个告警规则 

- HighMemoryUsage :当主机内存使用超过 90% 时触发告警 告警规则定义中包含如下信息:告警名称、触发条件、持续时间，标签以及注释  
告警规则名称为 HighMemoryUsage
 触发条件是 HighMemoryUsage > 90%，且持续时间超过 5 分钟时触发告警;  标签 severity 的值为 warning，表示告警级别为警告;
   注释 summary 的值为 Memory usage is {{ $value }}%，提供了有关告警的描述和当前内部使用率的信息。 
   
- 磁盘使用率告警示例

```
data: alerting\_rules.yml: |
groups:
- name: host-monitoring
rules:
- alert: HighDiskUsage
expr: node\_filesystem\_avail\_bytes{fstype="ext4"} / node\_filesystem\_size\_bytes{fstype="ext4"} \* 100 < 10 for: 5m
labels:
severity: critical annotations:
summary: High disk usage on {{ $labels.instance }} description: "Disk usage is {{ $value }}%"
```

配置说明:

述示例定义了一个名为 host-monitoring 的告警规则组，包含了 1 个告警规则 - - HighMemoryUsage :当主机内存使用超过 90% 时触发告警 告警规则定义中包含如下信息:告警名称、触发条件、持续时间，标签以及注释

- 告警规则名称为 HighDiskUsage
- 触发条件是 HighDiskUsage > 90%，且持续时间超过 5 分钟时触发告警;
- 标签 severity 的值为 critical，表示告警级别为严重;
- 注释 summary 的值为 Disk usage is {{ $value }}%，提供了有关告警的描述和当前内部使用率的信息。
- 确认告警规则状态

Prometheus 中查看当前活动的告警规则及其状态。在该页面中，可以看到每个告警规则的名称、状态、标签、摘要等信息，并且 可以通过搜索框来查找特定的告警规则。通过查看该页面，可以确认 Prometheus Alerting Rules 是否正在正常工作以及哪些告警规则 处于活动状态

## 配置告警通知

Alertmanager 是 Prometheus 生态系统中的一个独立组件，用于处理和路由告警通知。Alertmanager 可以与 Prometheus 一起使用，将告警通知发送给不同的接收端(如电子邮件、Slack、PagerDuty 等)，并支持一些高级功能，如抑制、分组和静音告警等。

- Prometheus 配置告警
Prometheus 的告警规则和计算规则与 Alertmanager 关联，需要在 Prometheus 配置文件中指定 Alertmanager 的地址和端口，并 在告警规则中设置 alertmanager\_config 字段，以便告警通知可以正确地路由到 Alertmanager。
Prometheus 配置文件中指定 Alertmanager 的地址和端口，在将告警通知发送到 alertmanager.onwalk.net 配置示例如下 :  alerting:
alertmanagers:
- follow\\_redirects: true
enable\\_http2: true scheme: http timeout: 10s api\\_version: v2 static\\_configs:
- targets:
- alertmanager.onwalk.net
- Alertmanager 配置告警

Alertmanager 和 Prometheus 之间的通信是通过 HTTP 协议进行的。当 Prometheus 检测到一个新的告警时，它会向 Alertmanager 发送一个 HTTP POST 请求，将告警信息发送给 Alertmanager。Alertmanager 将接收到的告警通知进行处理，并根据 配置文件中定义的接收器将告警通知发送到相应的接收方，相关参考配置如下:

 Alertmanager 的路由规则中定义如何将告警通知路由到 route 接收端

 Alertmanager 将所有严重级别为 critical 的告警通知发送到 default-receiver 接收端。

```
route:
receiver: default-receiver continue: false group_wait: 10s group_interval: 5m repeat_interval: 1h
receivers:
- name: default-receiver
email_configs:
- to: 'admin@example.com'
from: 'alertmanager@example.com' smarthost: smtp.gmail.com:587 auth_username: 'alertmanager@example.com' auth_identity: 'alertmanager@example.com' auth_password: 'password'
```

确保 Prometheus 和 Alertmanager 正在运行，并且告警规则和路由规则已经正确配置。当 Prometheus 触发告警时，Alertmanager 将会收到告警通知，并将其转发到指定的接收端。 Alertmanager 还可以通过第三方插件的方式配置其他类型的接收端，如微信、钉钉， AWS SNS 等。可以根据需要进行配置，并在路由规则中指定如何将告警通知路由到不同的接收端。

# reference

1 Grafana 文档:[https://grafana.com/docs/grafana/latest/](https://grafana.com/docs/grafana/latest/)

2 Prometheus 文档:[https://prometheus.io/docs/](https://prometheus.io/docs/)

3 deepflow 文档:[https://deepflow.io/docs/zh/](https://deepflow.io/docs/zh/)

4 Loki 文档:[https://grafana.com/docs/loki/latest/](https://grafana.com/docs/loki/latest/)

5 ClickHouse 文档:[https://clickhouse.tech/docs/en/](https://clickhouse.tech/docs/en/)

6 Qryn 文档:[https://qryn.metrico.in/#/introduction](https://qryn.metrico.in/#/introduction)

7 Alertmanager 文档:[https://prometheus.io/docs/alerting/alertmanager/](https://prometheus.io/docs/alerting/alertmanager/)

8 ObservabilityServer:[https://github.com/svc-design/ObservabilityServer](https://github.com/svc-design/ObservabilityServer)

9 ObservabilityAgent: [https://github.com/svc-design/ObservabilityAgent](https://github.com/svc-design/ObservabilityAgent)
