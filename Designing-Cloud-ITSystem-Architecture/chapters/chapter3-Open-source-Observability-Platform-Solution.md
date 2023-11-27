# 概述

**项目链接**：[https://github.com/open-source-solution-design/ObservabilityPlatform.git](https://github.com/open-source-solution-design/ObservabilityPlatform.git)

该解决方案使用 ClickHouse、Neo4j、VectorDB、PromQL、LogQL、OpenTracing、Prometheus、Grafana、AlertManager 和 DeepFlow 等开源工具。开源的可观察性平台解决方案通过 GitHub Actions 自动交付创建服务。

# 架构图

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-2810186/a4bab250e17d279a9a09c794249a09d6.png?qc_blockWidth=620&qc_blockHeight=435)

该解决方案使用以下开源软件：

- 数据收集：使用 Prometheus、OpenTelemetry，Deepflow-agent，Promtail，cloudquery 等工具从系统组件、应用程序和云账户数据同步
- 数据存储：使用 ClickHouse、Neo4j、VectorDB 等工具存储观测数据。
- 数据分析：使用 Prometheus、Grafana 等工具分析观测数据。
- 数据可视化：使用 Grafana 等工具以可视化的方式呈现观测数据。

可以提供资源状态系统或应用程序的性能和可靠性, 诊断和解决问题, 优化系统或应用程序的性能和功能分析等，包括以下应用场景：

优势

- 开源：该解决方案使用开源工具，因此成本低廉。
- 可扩展：该解决方案使用可扩展的技术栈，因此可以满足各种需求。
- 自动化：该解决方案使用 GitHub Actions 自动交付创建服务，因此可以快速部署和维护。

# CICD

## 流水线配置文件

配置文件位于 .github/workflows/pipeline.yaml 由四个阶段组成：

1. 构建测试：此阶段从源代码构建 APP, 并运行测试套件，以确保APP 正常工作。
2. Docker 镜像：此阶段构建一个包含 APP 的 Docker 镜像。
3. 设置 K3s：此阶段在远程服务器上设置 K3s 集群。
4. 部署应用：此阶段将 APP 部署到 K3s 集群。

## Playook 角色说明

- 可观察性平台配置库由以下角色组成：
    - 容器集群相关相关的 Ansible playbook roles
        - k3s: 提供管理 k3s 集群的任务。
        - k3s-addon: 部署 k3s 附加组件。
        - k3s-reset: 将 k3s 集群重置为初始状态。
        - secret-manger: 部署 secret-manager 来管理敏感数据。
        - cert-manager: 部署 cert-manager 以颁发 TLS 证书。
        - clickhouse: 部署 Clickhouse 以存储和分析时序数据。
        - observability-agent: 在 k3s 节点上部署可观察性代理。
        - observability-server: 部署可观察性服务器组件。
        - mysql: 部署 MySQL 以存储 Deepflow数据以及Grafana配置信息。
        - alerting: 存储 Prometheus Alertmanager Rules 。
    - 非容器集群相关的 Ansible playbook roles
        - node-exporter: 部署 node\_exporter 来收集系统指标。
        - prometheus-transfer: 转发 Prometheus 将指标传输到远程存储。
        - promtail-agent: 部署 Promtail 从节点收集日志。

## 触发器

管道由以下事件触发：

- 当打开或更新拉取请求时。
- 当代码推送到主分支时。
- 当工作流程手动调度时。

## 环境变量

在YAML文件或CI/CD流水线配置中定义的ENV变量：

- TZ: Asia/Shanghai：设置时区为Asia/Shanghai。
- REPO: "artifact.onwalk.net"：指定一个存储库的URL或标识符。
- IMAGE: base/${{ github.repository }}：基于GitHub存储库构建一个容器镜像名称。
- TAG: ${{ github.sha }}：将镜像标签设置为GitHub存储库的提交SHA。
- DNS\_AK: ${{ secrets.DNS\_AK }}：使用GitHub的密钥设置阿里云DNS访问密钥。
- DNS\_SK: ${{ secrets.DNS\_SK }}：使用GitHub的密钥设置阿里云DNS密钥。
- DEBIAN\_FRONTEND: noninteractive：将Debian前端设置为非交互模式，这在自动化脚本中很有用，可防止交互提示。
- HELM\_EXPERIMENTAL\_OCI: 1：启用Helm中的实验性OCI（Open Container Initiative）支持，允许Helm与OCI镜像一起使用。

如需在自己的账号运行这个Demo，只需要将 [https://github.com/open-source-solution-design/ObservabilityPlatform.git](https://github.com/open-source-solution-design/ObservabilityPlatform.git) 这个仓库Fork 到你自己的Github账号下，同时在

Settings -> Actions secrets and variables: 添加流水线需要定义的 secrets 变量

Server 相关 secrets 变量 

- HELM\_REPO\_USER            Artifact 仓库认证用户名
- HELM\_REPO\_REGISTRY      Artifact 仓库认证地址  
- HELM\_REPO\_PASSWORD    Artifact 仓库认证密码
- HOST\_USER                       部署K3S的主机OS登陆用户名        
- HOST\_IP                            部署K3S的主机IP地址
- HOST\_DOMAIN                   部署K3S的主机域名
- SSH\_PRIVATE\_KEY             访问K3S的主机的SSH 私钥
- DNS\_AK                             阿里云DNS 服务 AK (用于自动签发SSL证书和更新解析记录，发布ingress )
- DNS\_SK                             阿里云DNS 服务 SK (用于自动签发SSL证书和更新解析记录，发布ingress )

客户端相关 secrets 变量 

- APP\_HOST\_USER                       部署APP集群的master 主机OS登陆用户名        
- APP\_HOST\_IP                            部署APP集群的master 主机IP地址
- APP\_HOST\_DOMAIN                   部署APP集群的master 主机IP域名

一切就绪后，就可以看到。在这个CI工作流中，自动的完成镜像并推送到自定义的仓库，打包，并完成K3S集群的初始化，以及完成APP部署到K3S集群中。

# 部署后配置

## 服务端配置

1. 数据源配置 以 [https://grafana.onwalk.net](https://grafana.onwalk.net) 为例, 以 admin 身份登录，data sources -> Add new data sources 可以根据需要，选择对应数据源类型接入
2. 导入自定义 Dashboard， 上传 Dashboard Json 模版文件，选择对应数据源
ObservabilityPlatform 仓库提供了几个来自社区供参考的面板 [https://github.com/open-source-solution-design/ObservabilityPlatform/blob/main/charts/server/example/dashboard/](https://github.com/open-source-solution-design/ObservabilityPlatform/blob/main/charts/server/example/dashboard/) 
Grafana 社区提供很多的面板，可以根据需要选择，
3. 配置多集群中 deepflow-agent 配置，需要首先在Server端，利用 deepflow-ctl domain create 获取一个 K8sClusterID：

```
unset CLUSTER\_NAME
CLUSTER\_NAME="k8s-1"  # FIXME: K8s cluster name
cat << EOF | deepflow-ctl domain create -f -
name: $CLUSTER\_NAME
type: kubernetes
EOF
deepflow-ctl domain list $CLUSTER\_NAME  # Get K8sClusterID
```

1. 采集端

配置更多集群接入，执行步骤2，记录 K8sClusterID 和 deepflowserverip 写入 playbook/init\_observability-agent 然后执行 .github/workflows/setup-agent.yaml 流水线

# demo 示例

## 日志查询

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-2810186/c2a19f45fd2e070db64090946cb7942e.png?qc_blockWidth=620&qc_blockHeight=336)

## Node 节点资源状态

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-2810186/647b0687fcdc32ca56559752f99ce9a3.png?qc_blockWidth=620&qc_blockHeight=296)

## 集群应用资源状态

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-2810186/7f0df271bc9ac7b573f5bf84e5bd6e99.png?qc_blockWidth=620&qc_blockHeight=282)

## 资源拓扑图

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-2810186/fd24313c3ecb0b77e867948fae1cf0a9.png?qc_blockWidth=620&qc_blockHeight=286)

## 网络性能观测

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-2810186/02e1a6e04036ebe8fa6d9484aef9fed7.png?qc_blockWidth=620&qc_blockHeight=284)

## 服务监可用性监控

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-2810186/31ff31e4da78e3ea479b47ac0a4f5963.png?qc_blockWidth=620&qc_blockHeight=289)

# 参考部分

# API Endpoint

| name | URI |
|:----|:----|
| querying(promql, logql, tempo) | http://data-gateway.<domian>                            |
| metrics\_query                  | https://prometheus.<domian>/api/v1/query                |
| metrics\_remote\_write           | https://prometheus.<domian>/api/v1/remote/write         |
| logql\_remote\_write             | https://data-gateway.<domian>/loki/api/v1/push          |
| traces\_tempo\_push              | https://data-gateway.<domian>/tempo/api/push            |
| traces\_zipkin\_push | https://data-gateway.<domian>/api/v2/spans |
| traces\_oltp\_push | https://data-gateway.<domian>/v1/traces |


# 致谢

- 开源社区：没有开源社区的共享，是无法独立完成一个复杂的技术方案。感谢开源社区的所有贡献者，他们的辛勤工作为我们提供了宝贵的资源和知识。
    1. Prometheus：Prometheus 是领先的开源监控系统。我们使用 Prometheus 来收集和存储可观察性数据。
    2. Grafana：Grafana 是领先的开源可视化工具。我们使用 Grafana 来可视化可观察性数据。
    3. AlertManager：AlertManager 是领先的开源告警系统。我们使用 AlertManager 来发送可观察性数据告警。
    4. DeepFlow：DeepFlow 是云杉科技开源的基于eppf 应用可观察性分析软件。
    5. GCP Cloud: 没有 Google 慷慨的300$ 额度免费测试资源，无法完成方案验证
- 腾讯开发者平台：腾讯开发者平台为我们提供了分享平台，感谢腾讯开发者平台为我们提供的支持。
