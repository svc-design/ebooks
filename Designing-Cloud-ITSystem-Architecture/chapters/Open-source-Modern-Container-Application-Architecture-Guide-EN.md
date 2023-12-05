# Introduction

First, it's important to clarify two concepts: moving to the cloud and cloud-native. Moving to the cloud refers to the migration of applications, data, and business processes into a cloud computing environment. Cloud-native, on the other hand, is a method of building and running applications that leverages the elasticity, scalability, and agility of cloud computing.

# Differences Between Cloud-Native and Simple Cloud Migration

- Elasticity and Scalability: Cloud-native applications are designed with the dynamism of the cloud environment in mind, capable of automatically scaling based on demand. In contrast, applications that are simply moved to the cloud may not possess this elasticity.
- Microservices Architecture: Cloud-native applications often use a microservices architecture, breaking down an application into independently deployable services, whereas simple cloud migrations may still use a monolithic architecture.
- Containerization: Cloud-native applications typically utilize containers for packaging and running services to ensure environment consistency and portability. Traditional cloud-migrated applications may not leverage the advantages of containers.
- DevOps and Continuous Integration/Continuous Deployment (CI/CD): Cloud-native applications usually integrate DevOps culture and practices, including automated CI/CD processes, for rapid and frequent delivery of updates.

Lessons from Recent 2023 Cloud Service Failures in China, Recent cloud service failures in China have highlighted the importance of:

- High Availability and Disaster Recovery: The failures demonstrate that cloud applications must be designed to continue operating in the event of a failure, or at least recover quickly.
- Multi-Cloud and Hybrid Cloud Strategies: Reliance on a single cloud service provider can increase the risk of failure. Multi-cloud or hybrid cloud strategies can provide greater reliability.
- Performance Monitoring and Automation: Effective performance monitoring and automated failure recovery mechanisms are crucial.

# Characteristics of Modern Container Application Architecture

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/2810186/265333d41f942c4a6400d080325a649b.png?qc_blockWidth=660&qc_blockHeight=288)

- Scalability: Ability to automatically adjust resources according to load.
- Portability: Containerization allows applications to run in different environments and cloud platforms.
- Resilience: Designed with the possibility of failure in mind and the ability to remain stable during such events.
- Agility: Quick iteration and updating to meet changing market and technology demands.
- High Reliability: Ensuring reliable operation through redundant design and effective load balancing.
- Avoidance of Vendor Lock-In: Preventing being locked into a specific cloud service provider, ensuring business flexibility and control.
In light of China's recent experiences, to build a fluid, efficient, and reliable cloud application architecture, enterprises need to do more than just move to the cloud; they need to more deeply adopt cloud-native principles and practices. This includes using microservices, containerization, DevOps culture, and effective performance monitoring and disaster recovery strategies.

With continuous technological advancements, modern application architecture has become a hot topic in the software development field. This architecture is driven by four key characteristics: scalability, portability, resilience, and agility. Although there are many aspects to modern architecture, these features are fundamental.

- Scalability: The ability to rapidly and seamlessly expand or contract to accommodate increases or decreases in global demand.
- Portability: Ease of deployment across a variety of types of devices and infrastructures, whether public or private clouds.
- Resilience: The ability to failover in different availability zones, clouds, or data center newly launched clusters or virtual environments.
- Agility: The ability to update through automated CI/CD pipelines, achieving higher code release speeds and more frequent code pushes.
The provided reference architecture is based on these principles. It is not just a theoretical concept but also provides a practical toolchain, including continuous integration and deployment using GitHub CI, and Infrastructure as Code (IaC) tools like Pulumi for defining and configuring all necessary resources.

This reference architecture focuses on the following key principles:

- Platform Agnostic Cloud-Native: This architecture is designed to be platform agnostic, allowing you to deploy applications on different container orchestration platforms, such as Kubernetes (k8s) or lightweight k3s.
- Open Source Software (OSS) Priority: Preferring open source software ensures the architecture is built on solid and widely adopted tools and technologies.
- Everything as Code: Using Infrastructure as Code (IaC) to define and configure all the resources required for applications, ensuring consistency, reproducibility, and scalability.
- CI/CD Automation: Implementing continuous integration and continuous deployment (CI/CD) pipelines using GitHub CI, supporting automated build, test, and deployment processes.
- Security-Centric Development: Implementing best security practices at every stage of the architecture, including containerized builds, secure container registries like Harbor, and secure communication between services.
- Distributed Storage: Integrating distributed storage solutions in the architecture to ensure high availability and scalability of application data.ToolchainThe following tools are used in this reference architecture:
- Pipeline: GitHub CI
- IaC Tool: Pulumi
- Code Repository: GitHub
- Container Registry: Harbor
- Monitoring:
- Logging: Loki
- Tracing: Deepflow
- Metrics: Prometheus
- Notifications: Alertmanager
- Data Storage: Clickhouse
- Visualization: Grafana
- Cluster Management:
    - Kubernetes (k8s)
    - Lightweight Kubernetes (k3s)
- Ingress: Nginx
- DNS: Cloud DNS SaaS

# Quick Start

To start using this reference architecture, follow these steps:

Clone this repository to your local machine.

Set up the necessary tools mentioned above and ensure they are configured correctly.

Modify the code and configuration files according to the needs of your application.

Use Pulumi to provide the necessary infrastructure resources defined in the IaC files.

Configure the CI/CD pipeline in GitHub CI to automatically trigger builds and deployments.

Monitor your application using the provided monitoring stack.

Deploy your application to the target cluster using k8s or k3s.

Set up Nginx ingress and DNS to route traffic to your application.

For more detailed guidance and examples, refer to the documentation provided in this repository.

# Contributions

We welcome community contributions to enhance this reference architecture. If you have any suggestions, improvements, or bug fixes, please feel free to submit pull requests.

# License

This project is provided under the GPLv3 license, allowing use, copying, modification, and distribution, but must include the copyright and license statement.
