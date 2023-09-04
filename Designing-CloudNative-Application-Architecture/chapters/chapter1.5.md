
# 概述

应用架构是一个系统的高级结构。它是关于系统的一系列决策，包括系统的组成部分、这些部分之间的交互，以及对这些部分的引导性指南。这些决策通常是由企业的IT团队和关键干系人员共同作出的。

应用架构可以帮助确定一个系统的主要组件（如数据库、服务器、接口等），以及这些组件如何相互作用以完成特定的业务功能。此外，应用架构还可以定义如何将系统划分为不同的部分，以便于开发、测试和后续维护。

应用架构可以采用多种形式，包括单体架构、微服务架构、服务导向架构（SOA）、事件驱动架构等。选择哪种架构取决于多种因素，如项目需求、团队技能、预期的系统负载等。

应用架构是对一个系统如何设计和实现的高层次描述，它为开发团队提供了一个共同的框架，以便于理解整个系统的工作方式。

# 常见的应用架构

- 单体架构：在早期的软件开发中，大多数系统都是基于单体架构。所有的业务逻辑都在一个大的应用中，包括用户界面、服务器端的逻辑处理、数据访问等。这样的架构在系统规模较小、需求变化不频繁的情况下，可以简化开发和部署。
- 前后端分离：随着互联网的发展，用户交互越来越复杂，业务逻辑也越来越丰富。单体架构开始显得力不从心。前后端分离架构应运而生，前端负责用户交互，后端负责业务逻辑和数据处理。这种架构可以让前后端各自专注于自己的领域，提高开发效率。
- SOA（服务导向架构）：随着系统规模的进一步扩大和业务需求的复杂化，前后端分离仍然无法满足需求。SOA架构将系统划分为多个服务，每个服务都有明确的功能，通过网络进行通信。这种架构可以提高系统的可扩展性和复用性。
- 微服务：微服务是SOA架构的一种具体实现方式。它将系统划分为一组小的、独立的服务，每个服务都在各自独立的进程中运行，服务之间通过轻量级的通信机制（如HTTP RESTful API）进行通信。微服务更加精细化，更加注重服务的自治性。
- 服务网格：服务网格是一种基础设施层，用于处理服务到服务之间的通信。它在微服务架构中提供了一种透明、统一的方式来连接、保护、监控和管理服务。服务网格通常由一组轻量级的网络代理组成，这些代理与应用程序代码部署在一起，而无需知道其存在。这些代理负责通信的重试、超时、监控、追踪、服务发现、负载均衡等功能。

# 从单体架构向分布式架构

## 演变过程：

   - 单体架构：在单体架构中，所有的功能都集成在一个单一的应用中，通过函数调用进行交互。所有的组件运行在同一进程中，共享同一数据库。

   - 前后端分离：随着Web应用的复杂性增加，前后端分离成为了一种趋势。前端负责用户交互，后端负责处理业务逻辑。前后端之间通过API进行通信，典型的方式是HTTP/REST或者GraphQL。这种架构使前后端可以独立开发和部署。

   - SOA(Service-Oriented Architecture)：SOA是一种设计理念，将应用程序的不同功能模块化为独立的服务，这些服务可以通过网络进行通信。SOA强调业务功能的重用，每个服务都是独立的，可以被多个消费者调用。

   - 微服务：微服务是SOA的一种实现模式，它比SOA更加细粒度。在微服务架构中，每个服务都是一个小型的、独立部署的应用，它们通过轻量级的通信机制（如HTTP RESTful API）进行通信。微服务强调服务的自治性和轻量级通信。

   - 服务网格：服务网格是解决微服务中一些常见问题（例如服务发现、负载均衡、故障恢复、指标收集和监控等）的一种方法。它是一种基础设施层，用于处理服务到服务之间的通信。服务网格使得这些功能从应用代码中解耦出来，由基础设施层来处理。

## 各自的优缺点，解决和引入的问题：

   - 单体架构：
     - 优点：开发简单直接，部署简单，适合小型应用。
     - 缺点：随着系统复杂度的增加，维护和更新变得困难；缺乏弹性和可扩展性；故障隔离困难；并发处理能力有限。
     - 解决问题：对于小型应用，可以快速实现功能。
     - 引入问题：随着系统规模的扩大，维护和扩展变得困难。

   - 前后端分离：
     - 优点：前后端可以独立开发和部署，提高开发效率。
     - 缺点：需要定义清晰的API接口，增加了开发复杂性。
     - 解决问题：解决了前端和后端开发速度不匹配的问题，提高了开发效率。
     - 引入问题：需要维护API接口，增加了开发复杂性。

   - SOA：
     - 优点：服务可重用，可独立部署和扩展，提高了系统的灵活性和可扩展性。
     - 缺点：服务间通信增加了网络延迟；需要维护服务接口；服务治理复杂。
     - 解决问题：解决了单体架构的扩展性问题，提高了系统的灵活性和可扩展性。
     - 引入问题：增加了网络延迟，需要进行服务治理。

   - 微服务：
     - 优点：服务小而自治，易于开发和维护；可以使用不同的技术栈开发不同的服务；服务可以独立扩展。
     - 缺点：微服务之间的通信和协调增加了复杂性；对运维要求高；分布式系统可能会遇到数据一致性、网络延迟等问题。
     - 解决问题：解决了SOA中服务粒度大的问题，使得服务更加自治，更易于开发和维护。
     - 引入问题：微服务之间的通信和协调增加了复杂性，对运维要求高。

   - 服务网格：
     - 优点：解耦了业务代码和网络相关的功能，如负载均衡、服务发现、故障恢复、安全等；提供了统一的方式来观察、控制和保护微服务之间的通信。
     - 缺点：增加了系统的复杂性；对运维要求高。
     - 解决问题：解决了微服务中常见的网络相关问题，如服务发现、负载均衡、故障恢复等。
     - 引入问题：增加了系统的复杂性，对运维要求高。

## 为什么当下分布式应用发展为服务网格

在微服务架构中，应用程序通常被分解为多个独立的服务，这些服务需要通过网络进行通信。随着服务数量的增加，管理和监控这些服务间的通信变得越来越复杂。例如，如何处理服务间的负载均衡、故障恢复、服务发现、安全性、可观察性等问题。传统的方法是在每个服务中实现这些功能，但这会导致大量的代码重复，而且在不同的语言和框架中实现这些功能可能会有所不同。

服务网格的出现就是为了解决这些问题。服务网格是一种基础设施层，它将通信逻辑从应用代码中抽象出来，使开发人员可以专注于业务逻辑，而不是网络通信。通过使用服务网格，开发人员可以利用统一的方式来管理和监控服务间的通信，而无需关心底层的实现细节。

此外，服务网格还提供了一种标准化的方式来处理跨多个服务的策略和配置，例如安全策略、流量路由规则等。这大大简化了分布式系统的管理和运维。

因此，服务网格是目前分布式应用的一个重要解决方案，它可以帮助开发和运维人员更有效地处理微服务架构中的复杂性。

## 分布式应用系统的核心组成部分

一个典型的分布式应用架构主要由以下几部分组成：

1. 微服务：每个微服务都是一个独立的业务功能单元，可以独立部署和扩展。
2. API网关：API网关是微服务架构中的重要组成部分，它提供了请求路由、负载均衡、认证授权、限流熔断等功能。
3. 服务注册与发现：微服务架构中，由于服务数量众多，需要一个服务注册与发现机制来维护服务的健康状态和地址信息。
4. 配置中心：由于微服务数量众多，配置管理变得复杂，配置中心可以提供统一的配置管理服务。
5. 链路追踪：微服务架构中，一个请求可能需要经过多个服务，链路追踪可以帮助我们追踪和定位问题。
6. 日志监控：日志监控是必不可少的，它可以帮助我们了解系统的运行状态和性能状况。

支撑服务主要包括：

1. 数据库：每个微服务可能都需要一个数据库来存储数据，这些数据库可能是关系型数据库，也可能是NoSQL数据库。
2. 消息队列：消息队列用于实现服务之间的异步通信，提高系统的响应性能和可扩展性。
3. 容器平台：如Docker和Kubernetes等，提供容器化应用的部署、管理和扩展功能。
4. CI/CD工具：如Jenkins、GitLab CI/CD等，实现持续集成和持续部署，提高开发效率和质量。

## 微前端

通常来说，微服务是面向的后端服务架构设计，但是也有一种类似于后端微服务的前端开发架构。微前端是一种将前端应用拆分为可以独立开发、独立部署、独立运行的微应用的架构风格。

微前端的主要优点包括：

- 解耦：每个微应用都可以由不同的团队使用不同的技术栈独立开发和测试。
- 并行开发：由于微应用可以独立开发，因此可以并行进行，提高开发效率。
- 增量升级：可以逐步升级或重构系统的一部分，而不是一次性重写整个系统。
- 独立部署：每个微应用可以独立部署，不会影响其他应用。

微前端的主要挑战包括：

- 性能：如果没有正确处理，加载和运行多个微应用可能会影响性能。
- 一致性：需要努力确保各个微应用的外观和感觉的一致性。
- 共享状态：在微应用之间共享状态可能会比较复杂。

一些流行的微前端框架和解决方案包括Single-SPA、qiankun、Luigi等。目前React和Vue3是比较流行的前端JavaScript框架，它们可以配合后端微服务实现前后端分离，提升用户体验和开发效率

# 不同语言的分布式开发框架

微服务开发技术栈的选择通常取决于特定的项目需求、团队技能和语言特性。不同的编程语言具有不同的特性和优点，因此需要不同的微服务开发技术栈。不同语言的微服务开发技术栈反映了该语言的优点和应用场景，选择哪种技术栈取决于项目需求、团队技能和语言特性。

以下是列举 java php python nodejs vue3 react go rust c/c++ ruby  等主流开发语言开发技术栈参考。

## Java

Java有强大的类型安全和面向对象特性，适合构建复杂的商业逻辑系统，因此Spring Boot和Spring Cloud等技术栈提供了全面且成熟的解决方案

| 类别 | 选择 |
|:----|:----|
| 微服务 | Spring Boot + Spring Cloud, Dubbo 3 |
| API网关 | Spring Cloud Gateway 或 Zuul |
| 服务注册与发现 | Eureka、Zookeeper、Consul、Etcd, Nacos |
| 配置中心 | Spring Cloud Config、Apollo、Consul, Nacos |
| 链路追踪 | Jaeger、Zipkin, SkyWalking |
| 日志监控 | ClickHouse, Prometheus + Grafana  |
| 数据库 | MySQL、PostgreSQL、MongoDB  |
| 消息队列 | Kafka, RabbitMQ, ActiveMQ |


## Go

Go语言因其简洁性和高性能，适合构建高并发微服务，Gin和Beego等框架提供了高效的工具。

| 类别 | 选择 |
|:----|:----|
| 微服务 | Go Kit 或者 Micro |
| API网关 | Krakend 或 Gloo |
| 服务注册与发现 | Eureka、Zookeeper、Consul、Etcd, Nacos |
| 配置中心 | Apollo、Consul, Nacos |
| 链路追踪 | Jaeger、Zipkin, SkyWalking |
| 日志监控 | ClickHouse, Prometheus + Grafana  |
| 数据库 | MySQL、PostgreSQL、MongoDB  |
| 消息队列 | Kafka, RabbitMQ, NSQ |


## Python

Python在数据处理和机器学习领域有优势，Flask和Django等轻量级框架能满足快速开发和数据处理的需求。

| 类别 | 选择 |
|:----|:----|
| 微服务 | Flask + Nameko 或 FastAPI |
| API网关 | N/A |
| 服务注册与发现 | Eureka、Zookeeper、Consul、Etcd, Nacos |
| 配置中心 | Apollo、Consul, Nacos |
| 链路追踪 | Jaeger、Zipkin, SkyWalking |
| 日志监控 | ClickHouse, Prometheus + Grafana  |
| 数据库 | MySQL、PostgreSQL、MongoDB  |
| 消息队列 | Kafka, RabbitMQ, Celery |


## **Node.js**

Node.js以其非阻塞I/O模型和事件驱动架构，适合处理高并发I/O密集型应用，Express.js和Koa.js等技术栈能提供高效、灵活的解决方案。

| 类别 | 选择 |
|:----|:----|
| 微服务 | Express.js 或 Nest.js |
| API网关 | Express Gateway 或 Fastify |
| 服务注册与发现 | Eureka、Zookeeper、Consul、Etcd, Nacos |
| 配置中心 | Apollo、Consul, Nacos |
| 链路追踪 | Jaeger、Zipkin, SkyWalking |
| 日志监控 | ClickHouse, Prometheus + Grafana  |
| 数据库 | MySQL、PostgreSQL、MongoDB  |
| 消息队列 | Kafka, RabbitMQ, Bull.js |


## Ruby

Ruby则以其优雅和简洁著称，Ruby on Rails框架提供了快速开发Web应用的能力。

| 技术需求 | Ruby |
|:----|:----|
| API网关 | Sinatra, Grape |
| 服务注册与发现 | Consul, Etcd (通过HTTP/gRPC客户端) |
| 配置中心 | Apollo, Consul (通过HTTP/gRPC客户端) |
| 链路追踪 | OpenTelemetry Ruby SDK |
| 日志监控 | Logger + ClickHouse, Prometheus + Grafana |
| 数据库 | ActiveRecord (MySQL, PostgreSQL), MongoDB Ruby Driver |
| 消息队列 | Bunny (RabbitMQ), ruby-kafka (Kafka) |


##  **Rust/C/C++** 

Rust和C/C++适合构建系统级服务。特别适合在需要高性能、并发处理和内存安全的场景下使用的分布式服务，例如物联网、游戏服务器、文件系统等。

**Rust**:

| 技术需求 | Rust |
|:----|:----|
| API网关 | Actix-web, Rocket |
| 服务注册与发现 | Consul, Etcd (通过HTTP/gRPC客户端) |
| 配置中心 | Apollo, Consul (通过HTTP/gRPC客户端) |
| 链路追踪 | Opentelemetry-rust |
| 日志监控 | log, slog + ClickHouse, Prometheus + Grafana |
| 数据库 | Diesel (MySQL, PostgreSQL), MongoDB Rust Driver |
| 消息队列 | lapin (RabbitMQ), rdkafka (Kafka) |


**C/C++**:

| 技术需求 | C/C++ |
|:----|:----|
| API网关 | Kong |
| 服务注册与发现 | ZooKeeper |
| 配置中心 | ZooKeeper |
| 链路追踪 | OpenTracing API |
| 日志监控 | log4cpp, spdlog + ClickHouse, Prometheus + Grafana |
| 数据库 | MySQL C API, libpq (PostgreSQL), MongoDB C Driver |
| 消息队列 | librabbitmq (RabbitMQ), librdkafka (Kafka) |

# 各类服务网格方案

## 开源软件服务网格参考

| 开源软件 | API网关 | 服务网格 | 服务注册与发现 | 配置中心 | 链路追踪 | 日志监控 |
| --- | --- | --- | --- | --- | --- | --- |
| eBPF/Cilium | Kong/Envoy/Apisix | Cilium | Consul/Etcd/Nacos | Etcd/Consul/Nacos | Jaeger/Zipkin | Prometheus/ClickHouse/Grafana |
| Istio | Kong/Envoy/Apisix | Istio | Consul/Etcd/Nacos | Etcd/Consul/Nacos | Jaeger/Zipkin | Prometheus/ClickHouse/Grafana |
| Linkerd | Kong/Envoy/Apisix | Linkerd | Consul/Etcd/Nacos | Etcd/Consul/Nacos | Jaeger/Zipkin | Prometheus/ClickHouse/Grafana |

## 云服务商提供的服务网格

| 云服务商 | API网关 | 服务网格 | 服务注册与发现 | 配置中心 | 链路追踪 | 日志监控 |
| --- | --- | --- | --- | --- | --- | --- |
| AWS | Amazon API Gateway | AWS App Mesh | AWS Cloud Map | AWS Systems Manager AppConfig | AWS X-Ray | Amazon CloudWatch |
| GCP (Google Cloud Platform) | Google Cloud Endpoints | Google Service Mesh (based on Istio) | Google Cloud Service Directory | Google Cloud Runtime Configuration API | Google Cloud Trace | Google Cloud Monitoring |
| Microsoft Azure | Azure API Management | Azure Service Fabric Mesh | Azure Service Fabric DNS service | Azure App Configuration Service  | Azure Monitor Application Insights (Trace) | Azure Monitor |
| 阿里云 | 阿里云API网关 | 阿里云服务网格（基于Istio）| nacos| 阿里云ACM配置中心 | 阿里云链路追踪（ARMS）| 阿里云日志服务（SLS）|
| 腾讯云 | 腾讯云API网关 | 腾讯云TSF（基于Istio）| 腾讯云服务注册与发现（Spring Cloud等）| 腾讯云配置中心（TSE）| 腾讯云链路追踪（TAPM）| 腾讯云日志服务（CLS）|


## 云服务商提供的相关云原生监控服务

| 云服务商 | Prometheus | Grafana | PromQL | LogQL | OpenTelemetry | 原生托管服务 |
|:----|:----|:----|:----|:----|:----|:----|
| AWS | 部分支持，需要使用Amazon Managed Service for Prometheus (AMP) | 支持，通过Amazon Managed Grafana | 部分支持，需要使用AMP | 不支持 | 支持，通过AWS Distro for OpenTelemetry | Amazon Managed Service for Prometheus (AMP), AWS Distro for OpenTelemetry, Amazon Managed Grafana |
| GCP | 支持，通过Cloud Monitoring | 需要自行部署和管理 | 支持，通过Cloud Monitoring | 不支持 | 支持，通过Cloud Trace and Cloud Monitoring | Cloud Operations (formerly Stackdriver) |
| Azure | 支持，通过Azure Monitor for containers | 需要自行部署和管理 | 部分支持，通过Azure Monitor for containers | 不支持 | 支持，通过Azure Monitor - Application Insights | Azure Monitor for containers, Azure Monitor - Application Insights |
| 阿里云 | 部分支持，需要使用ARMS Prometheus服务 | 需要自行部署和管理 | 部分支持，需要使用ARMS Prometheus服务 | 不支持 | 支持，通过ARMS Application Real-Time Monitoring Service (ARMS) | ARMS Prometheus服务, ARMS Application Real-Time Monitoring Service (ARMS) |
| 腾讯云 | 部分支持，需要使用云原生监控服务 | 需要自行部署和管理 | 部分支持，需要使用云原生监控服务 | 不支持 | 支持，通过腾讯云监控全链路跟踪服务 | 云原生监控服务, 腾讯云监控全链路跟踪服务 |
| AWS-CN (中国) | 部分支持，需要使用Amazon Managed Service for Prometheus (AMP) | 支持，通过Amazon Managed Grafana (可能需要确认) | 部分支持，需要使用AMP | 不支持 | 支持，通过AWS Distro for OpenTelemetry (可能需要确认) | Amazon Managed Service for Prometheus (AMP), AWS Distro for OpenTelemetry, Amazon Managed Grafana (可能需要确认) |

# 相关参考文档

**开源软件**

1. eBPF/Cilium：https://docs.cilium.io/en/latest/
2. Kong/Envoy/Apisix：https://docs.konghq.com/, https://www.envoyproxy.io/docs/envoy/latest/, https://apisix.apache.org/docs/
3. Consul/Etcd/Nacos：https://www.consul.io/docs/, https://etcd.io/docs/, https://nacos.io/en-us/docs/
4. Jaeger/Zipkin：https://www.jaegertracing.io/docs/, https://zipkin.io/pages/documentation.html
5. Prometheus/ClickHouse/Grafana：https://prometheus.io/docs/introduction/overview/, https://clickhouse.tech/docs/en/, https://grafana.com/docs/grafana/latest/

**服务网格**

1. Istio：https://istio.io/latest/docs/
2. Linkerd：https://linkerd.io/2/overview/
3. eBPF/Cilium：https://docs.cilium.io/en/latest/

**API网关**

1. Kong：https://docs.konghq.com/
2. Envoy：https://www.envoyproxy.io/docs/envoy/latest/
3. Apisix：https://apisix.apache.org/docs/

**服务注册与发现**

1. Consul：https://www.consul.io/docs/
2. Etcd：https://etcd.io/docs/
3. Nacos：https://nacos.io/en-us/docs/
4. Zookeeper: https://zookeeper.apache.org/

**配置中心**

1. Etcd：https://etcd.io/docs/
2. Consul：https://www.consul.io/docs/
3. Nacos：https://nacos.io/en-us/docs/
4. Apollo: https://github.com/ctripcorp/apollo

**链路追踪**

1. Jaeger：https://www.jaegertracing.io/docs/
2. Zipkin：https://zipkin.io/pages/documentation.html
3. SkyWalking: https://skywalking.apache.org/

**日志监控**

1. Prometheus：https://prometheus.io/docs/introduction/overview/
2. ClickHouse：https://clickhouse.tech/docs/en/
3. Grafana：https://grafana.com/docs/grafana/latest/

**Java**：

- Dubbo 3: [http://dubbo.apache.org/en-us/](http://dubbo.apache.org/en-us/)
- Spring Boot: [https://spring.io/projects/spring-boot](https://spring.io/projects/spring-boot)
- Spring Cloud: [https://spring.io/projects/spring-cloud](https://spring.io/projects/spring-cloud)
- Spring Cloud Gateway: [https://spring.io/projects/spring-cloud-gateway](https://spring.io/projects/spring-cloud-gateway)
- Spring Cloud Config: [https://spring.io/projects/spring-cloud-config](https://spring.io/projects/spring-cloud-config)
- Zuul: [https://github.com/Netflix/zuul](https://github.com/Netflix/zuul)
- Eureka: [https://github.com/Netflix/eureka](https://github.com/Netflix/eureka)
- Nacos: [https://nacos.io/en-us/](https://nacos.io/en-us/)

**Go**:

- Go Kit: [https://gokit.io/](https://gokit.io/)
- Micro: [https://micro.mu/](https://micro.mu/)
- Krakend: [https://www.krakend.io/](https://www.krakend.io/)
- Gloo: [https://docs.solo.io/gloo/latest/](https://docs.solo.io/gloo/latest/)
- NSQ: [http://nsq.io/](http://nsq.io/)

**Python**:

- Flask: [http://flask.palletsprojects.com/](http://flask.palletsprojects.com/)
- Nameko: [https://nameko.readthedocs.io/en/stable/](https://nameko.readthedocs.io/en/stable/)
- FastAPI: [https://fastapi.tiangolo.com/](https://fastapi.tiangolo.com/)
- Celery: [http://www.celeryproject.org/](http://www.celeryproject.org/)

**Node.js**:

- Express.js: [http://expressjs.com/](http://expressjs.com/)
- Nest.js: [https://nestjs.com/](https://nestjs.com/)
- Express Gateway: [https://www.express-gateway.io/](https://www.express-gateway.io/)
- Fastify: [https://www.fastify.io/](https://www.fastify.io/)
- Bull.js: [https://github.com/OptimalBits/bull](https://github.com/OptimalBits/bull)

**Ruby**:

- Sinatra: [http://sinatrarb.com/](http://sinatrarb.com/)
- Grape: [https://github.com/ruby-grape/grape](https://github.com/ruby-grape/grape)
- OpenTelemetry Ruby SDK: [https://github.com/open-telemetry/opentelemetry-ruby](https://github.com/open-telemetry/opentelemetry-ruby)
- ActiveRecord: [https://guides.rubyonrails.org/active\_record\_basics.html](https://guides.rubyonrails.org/active_record_basics.html)
- Bunny (RabbitMQ): [http://rubybunny.info/](http://rubybunny.info/)
- ruby-kafka (Kafka): [https://github.com/zendesk/ruby-kafka](https://github.com/zendesk/ruby-kafka)

**Rust/C/C++**:

Rust:

- Actix-web: [https://actix.rs/](https://actix.rs/)
- Rocket: [https://rocket.rs/](https://rocket.rs/)
- Opentelemetry-rust: [https://github.com/open-telemetry/opentelemetry-rust](https://github.com/open-telemetry/opentelemetry-rust)
- Diesel: [http://diesel.rs/](http://diesel.rs/)
- lapin (RabbitMQ): [https://github.com/CleverCloud/lapin](https://github.com/CleverCloud/lapin)
- rdkafka (Kafka): [https://github.com/fede1024/rust-rdkafka](https://github.com/fede1024/rust-rdkafka)

C/C++:

- Kong: [https://konghq.com/](https://konghq.com/)
- ZooKeeper: [https://zookeeper.apache.org/](https://zookeeper.apache.org/)
- OpenTracing API: [https://opentracing.io/guides/c-plus-plus/](https://opentracing.io/guides/c-plus-plus/)
- log4cpp: [http://log4cpp.sourceforge.net/](http://log4cpp.sourceforge.net/)
- spdlog: [https://github.com/gabime/spdlog](https://github.com/gabime/spdlog)
- MySQL C API: [https://dev.mysql.com/doc/c-api/8.0/en/](https://dev.mysql.com/doc/c-api/8.0/en/)
- libpq (PostgreSQL): [https://www.postgresql.org/docs/9.5/libpq.html](https://www.postgresql.org/docs/9.5/libpq.html)
- MongoDB C Driver: [http://mongoc.org/](http://mongoc.org/)
- librabbitmq (RabbitMQ): [https://github.com/alanxz/rabbitmq-c](https://github.com/alanxz/rabbitmq-c)
- librdkafka (Kafka): [https://github.com/edenhill/librdkafka](https://github.com/edenhill/librdkafka)
