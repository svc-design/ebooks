
# 什么是可观测

可观测性（Observability）是指系统可以由其外部输出推断其其内部状态的程度。系统的可观察性和可控制性是数学上对偶的概念。

在现代软件系统和云计算中，可观测性在确保应用和基础架构的可靠性、性能和安全性方面发挥着越来越重要的作用。随着软件系统的复杂程度不断增加、微服务的广泛采用以及对分布式架构的日益依赖，可观测性的重要性也越来凸显。

可观测性主要包括以下三个方面：

- 日志：日志是系统运行时收集的有关系统事件的记录，包括错误、警告、信息等。日志可以提供系统内部状态的详细信息，例如系统的启动和关闭、资源的使用情况、错误和异常等。
指标：指标是系统运行时收集的有关系统性能的统计数据，例如 CPU 使用率、内存使用率、网络流量等。
- 指标可以提供系统运行状态的概览，例如系统的整体健康状况、性能瓶颈等。
- 链路追踪：链路追踪是系统中请求和响应的全路径跟踪，可以帮助分析系统的性能瓶颈、错误和异常等问题。

可观测性工具可以帮助系统管理员和开发人员收集和分析上述数据，从而提高对系统的理解和控制能力。

以下是可观测性的一些具体应用：

1. 故障排除：可观测性工具可以帮助系统管理员和开发人员快速定位和解决系统故障。
2. 性能优化：可观测性工具可以帮助系统管理员和开发人员识别系统的性能瓶颈，从而进行优化。
3. 安全监控：可观测性工具可以帮助系统管理员和开发人员监控系统的安全状态，从而防止安全事件的发生。

# 监控的演变

从单体应用时代到微服务时代，（指标，日志，链路）监控数据基数的维度发生了以下变化：

## 单体应用

在单体应用时代，应用通常是一个整体，由一个工程打包部署到一个服务器上。因此，监控数据的基数通常是单一的，例如服务器的 CPU、内存、网络等指标。

## SOA应用

在 SOA 时代，应用被拆分为多个独立的服务，每个服务可以独立开发、部署和管理。因此，监控数据的基数变得更加复杂，需要关注每个服务的资源使用情况、性能指标等。

## 分布式应用

在微服务时代，应用被拆分为更加细粒度的微服务，每个微服务通常只负责一个特定的业务功能。因此，监控数据的基数变得更加庞大，需要关注每个微服务的资源使用情况、性能指标、链路追踪等数据。

具体来说，指标、日志、链路追踪在不同时代的监控数据基数维度如下：

｜ 阶段 ｜	指标	日志	链路追踪

单体应用时代	服务器资源使用率、性能指标等	应用运行日志	无

SOA时代	服务资源使用率、性能指标等	服务运行日志	服务间调用链路

微服务时代	微服务资源使用率、性能指标等	微服务运行日志	微服务间调用链路

随着应用架构的演进，监控数据基数的维度越来越庞大，对监控系统的设计和实现提出了更高的要求。监控系统需要能够采集、存储和分析来自不同来源、不同维度的监控数据，从而为应用的运行维护提供全面的支持。

# 资源监控和应用可观测

传统面向资源的监控主要关注系统的运行状态，包括系统的整体健康状况、性能瓶颈等。传统面向资源的监控通常使用指标来衡量系统的运行状态，例如 CPU 使用率、内存使用率、网络流量等。

面向应用的可观测性则不仅关注系统的运行状态，还关注应用的业务逻辑和数据。面向应用的可观测性通常使用日志、链路追踪等技术来收集和分析应用运行时产生的数据。

## 区别

- 维度	传统面向资源的监控	面向应用的可观测性
- 关注点	系统运行状态	应用运行状态、业务逻辑、数据
- 数据来源	指标	日志、链路追踪
- 分析目的	定位故障、优化性能	定位故障、优化性能、分析业务逻辑、理解数据

## 联系

传统面向资源的监控是面向应用的可观测性的一部分。面向应用的可观测性需要收集和分析系统运行状态的指标，这些指标通常由传统面向资源的监控提供。

## 范围

传统面向资源的监控的范围通常局限于系统层面，例如服务器、容器、数据库等。面向应用的可观测性则可以扩展到应用层面，例如应用的业务逻辑、数据等。

具体来说，传统面向资源的监控和面向应用的可观测性在以下几个方面存在区别：

- 关注点不同：传统面向资源的监控主要关注系统的运行状态，例如系统的整体健康状况、性能瓶颈等。而面向应用的可观测性则不仅关注系统的运行状态，还关注应用的业务逻辑和数据。
- 数据来源不同：传统面向资源的监控通常使用指标来衡量系统的运行状态。而面向应用的可观测性则通常使用日志、链路追踪等技术来收集和分析应用运行时产生的数据。
- 分析目的不同：传统面向资源的监控主要用于定位故障、优化性能。而面向应用的可观测性则可以用于定位故障、优化性能、分析业务逻辑、理解数据。

具体来说，面向资源的监控和面向应用的可观测性在以下几个方面存在联系：

1. 传统面向资源的监控是面向应用的可观测性的一部分：面向应用的可观测性需要收集和分析系统运行状态的指标，这些指标通常由传统面向资源的监控提供。
2. 传统面向资源的监控可以为面向应用的可观测性提供基础：传统面向资源的监控可以为面向应用的可观测性提供系统运行状态的指标，这些指标可以帮助分析应用的业务逻辑和数据。

具体来说，传统面向资源的监控和面向应用的可观测性在以下几个方面存在范围差异：

1. 传统面向资源的监控的范围通常局限于系统层面：例如服务器、容器、数据库等。
2. 面向应用的可观测性则可以扩展到应用层面：例如应用的业务逻辑、数据等。

面向资源的监控和面向应用的可观测性是两个相关但不同的概念。传统面向资源的监控是面向应用的可观测性的一部分，可以为面向应用的可观测性提供基础。而面向应用的可观测性则可以扩展到应用层面，为应用的业务逻辑和数据分析提供支持。

系统监控主要关注系统的运行状态，包括系统的整体健康状况、性能瓶颈等。系统监控通常使用指标来衡量系统的运行状态，例如 CPU 使用率、内存使用率、网络流量等。

应用可观测则不仅关注系统的运行状态，还关注应用的业务逻辑和数据。应用可观测通常使用日志、链路追踪等技术来收集和分析应用运行时产生的数据。

具体来说，系统监控和应用可观测的区别可以总结如下：

维度	系统监控	应用可观测

关注点	系统运行状态	应用运行状态、业务逻辑、数据

数据来源	指标	日志、链路追踪

分析目的	定位故障、优化性能	定位故障、优化性能、分析业务逻辑、理解数据

系统监控关注的 CPU、MEM、Used、Load 等指标都属于系统运行状态的范畴。

应用可观测关注的 SLO、SLI、时间测量、事件测量、可用性等则都属于应用运行状态、业务逻辑和数据的范畴。

例如，SLO 是应用的服务级别目标，SLI 是衡量 SLO 的指标，时间测量和事件测量可以帮助分析应用的业务逻辑，可用性则可以帮助了解应用的数据情况。

以下是一些针对监控数据基数演变的建议：

采用分布式监控系统，将监控数据分布式存储和处理，以应对监控数据基数的增长。

采用数据分析技术，对监控数据进行分析处理，从中提取有价值的信息，以提高监控的效率和效果。

采用自动化工具，减少人工干预，提高监控的自动化程度。

# 基数的维度

# 监控数据存储的演进

随着应用架构的演进，监控数据的存储方式也不断变迁。在单体应用时代，文件存储可以满足监控数据的存储需求。在 SOA 和微服务时代，需要使用分布式数据库，例如 TSDB、NoSQL 数据库等。在未来，随着监控数据量的增长和分析需求的增加，图数据库等新兴数据库技术将在监控数据存储方面发挥越来越重要的作用。

存储方式	数据模型	存储效率	查询效率	适用数据类型	适用场景	局限性

文件存储	非结构化	低	低	所有	简单数据存储	数据管理复杂、可扩展性差

SQLDB	关系型	高	高	结构化	数据分析	不擅长存储非结构化数据、横向扩展能力差

TSDB	时序	高	高	时序数据	监控指标	不擅长存储非结构化数据、支持的数据类型有限

NoSQL	非关系型	高	低至高	所有	多样化数据存储	数据模型灵活、查询效率不如关系型数据库

行数据库	行	高	高	结构化	日志数据	数据模型灵活

列数据库	列	高	高	非结构化	链路追踪数据	数据模型灵活

图数据库	图	高	高	关系数据	应用拓扑	数据模型灵活

对比总结

- 文件存储：最简单易用，但数据管理复杂、可扩展性差。适用于简单数据存储。
- SQLDB：数据模型完整、查询效率高，但不擅长存储非结构化数据、横向扩展能力差。适用于数据分析。
- TSDB：支持时间戳索引、数据压缩、数据采样，但不擅长存储非结构化数据、支持的数据类型有限。适用于监控指标。
- NoSQL：数据模型灵活、横向扩展能力强、成本低廉，但查询效率不如关系型数据库。适用于多样化数据存储。
- 行数据库：存储效率高、查询效率高，适用于结构化数据，例如日志数据。
- 列数据库：存储效率高、查询效率高，适用于非结构化数据，例如链路追踪数据。
- 图数据库：可以有效存储和分析复杂的关系数据，具有高性能和可扩展性，适用于应用拓扑。

# 监控系统技术选型

监控系统	指标数据	日志数据	链路追踪数据

Nagios	文件存储	文件存储	不支持

Zabbix	文件存储	文件存储	不支持

Prometheus	TSDB	TSDB	不支持

可观测平台	TSDB	NoSQL/图数据库	TSDB/NoSQL/图数据库

Nagios 和 Zabbix 通常使用本地文件存储，也可以使用第三方文件存储系统，例如 Elasticsearch。

Prometheus 通常使用 InfluxDB、Grafana 等 TSDB 和可视化工具。

可观测平台 通常使用 OpenTelemetry、Prometheus 等 TSDB，以及 Elasticsearch、MongoDB 等 NoSQL 或图数据库。

选择建议

指标数据：TSDB 是存储指标数据的最佳选择，因为它具有高性能、高可靠性和可扩展性。

日志数据：NoSQL 数据库是存储日志数据的最佳选择，因为它具有灵活的存储结构和高可扩展性。

链路追踪数据：图数据库是存储链路追踪数据的最佳选择，因为它可以有效存储和分析复杂的关系数据。

Nagios 和 Zabbix 是传统的监控系统，主要用于监控系统的资源使用情况、性能指标等。它们通常使用文件存储来存储指标数据和日志数据。

Prometheus 是开源的监控系统，专注于监控指标数据。它使用 TSDB 来存储指标数据，支持对指标数据进行快速查询。

可观测平台 是面向应用的可观测性平台，不仅可以监控指标数据，还可以监控日志数据和链路追踪数据。它们通常使用 TSDB、NoSQL 或图数据库来存储指标数据、日志数据和链路追踪数据。

2.5 列数据库和图数据库的优势

随着监控数据量的增长，对监控数据的存储效率和可扩展性提出了更高的要求。列数据库和图数据库具有以下优势，使它们成为监控数据存储的主流选择：

随着人工智能技术的不断发展，人工智能辅助监控 (AIGC) 成为了监控领域的热门趋势。AIGC 可以利用人工智能技术，自动化监控任务，提高监控效率和准确性。

在 AIGC 中，向量数据库可以发挥重要的辅助作用。向量数据库可以有效存储和分析非结构化数据，例如日志数据和链路追踪数据。这些数据通常具有以下特点：

数据量大，结构复杂。

需要对数据进行快速查询，例如查询指定时间段内的日志数据或链路追踪数据。

向量数据库的存储效率和查询效率可以满足这些需求。此外，向量数据库还支持人工智能技术，可以用于以下应用场景：

- 异常检测：向量数据库可以用于存储历史数据，并利用人工智能技术进行异常检测。
- 故障诊断：向量数据库可以用于存储日志数据和链路追踪数据，并利用人工智能技术进行故障诊断。
- 性能优化：向量数据库可以用于存储监控数据，并利用人工智能技术进行性能优化。

向量数据库可以为 AIGC 提供以下优势：有效存储和分析非结构化数据。支持人工智能技术，可以用于异常检测、故障诊断和性能优化等应用场景。

以下是一些具体的例子：

1. 在异常检测中，向量数据库可以存储历史数据，并利用人工智能技术进行异常检测。例如，可以利用机器学习算法，对历史数据中的异常模式进行学习，并在新的监控数据中进行识别。
2. 在故障诊断中，向量数据库可以存储日志数据和链路追踪数据，并利用人工智能技术进行故障诊断。例如，可以利用自然语言处理算法，对日志数据进行分析，并识别可能导致故障的关键信息。
3. 在性能优化中，向量数据库可以存储监控数据，并利用人工智能技术进行性能优化。例如，可以利用机器学习算法，对监控数据中的性能指标进行分析，并找出性能瓶颈。

随着 AIGC 技术的不断发展，向量数据库在监控领域的应用将会越来越广泛。

# 构建一个开源的可观测性平台

将不同的软件组合在一起，根据实际的需要，构建一个满足特定需求的可观测平台。例如，可以将 Prometheus、Grafana 和 AlertManager 组合在一起，构建一个基本的可观测平台。也可以将 Prometheus、Grafana、AlertManager 和 DeepFlow 组合在一起，构建一个功能更强大的可观测平台

开源可观测平台软件选型组合主要包括以下几个方面：

数据存储：ClickHouse、Neo4j、VectorDB 等 TSDB、NoSQL 或图数据库。

指标数据采集：OpenTelemetry、Prometheus 等。

可视化：Grafana 等。

告警：AlertManager 等。

故障诊断：DeepFlow 等。

- ClickHouse 是列式数据库，具有高性能、高可靠性和可扩展性，适合存储指标数据。
- Neo4j 是图数据库，适合存储链路追踪数据。
- VectorDB 是向量数据库，适合存储日志数据和链路追踪数据。
- PromQL 是 Prometheus 的查询语言，用于查询指标数据。
- LogQL 是 Grafana 的查询语言，用于查询日志数据。
- OpenTelemetry 是链路追踪标准，用于采集和存储链路追踪数据的工具集。
- Prometheus 是 TSDB，用于存储指标数据。
- Grafana 是可视化工具，用于可视化指标数据、日志数据和链路追踪数据。
- AlertManager 是告警系统，用于发送告警通知。
- DeepFlow 是故障诊断工具，用于分析监控数据，找出系统故障的原因。

# 参考

1. 开源可观测平台解决方案 [https://cloud.tencent.com/developer/article/2363793](https://cloud.tencent.com/developer/article/2363793)
2. 开源可观测平台解决方案-运维手册 [https://cloud.tencent.com/developer/article/2363815](https://cloud.tencent.com/developer/article/2363815)
