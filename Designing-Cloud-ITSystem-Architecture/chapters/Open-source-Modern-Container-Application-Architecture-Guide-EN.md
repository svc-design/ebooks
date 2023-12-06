# Introduction

Two concepts need to be clarified first: cloud migration and cloud-native. Cloud migration refers to the process of moving applications, data, and business processes to a cloud computing environment. Cloud-native, on the other hand, is an approach to building and running applications that exploits the elasticity, scalability, and agility of cloud computing.

Differences Between Cloud-Native and Simple Cloud Migration
- Elasticity and Scalability: Cloud-native applications are designed with the cloud's dynamics in mind, able to scale automatically in response to demand. In contrast, applications that are merely migrated to the cloud may not possess this kind of elasticity.
- Microservices Architecture: Cloud-native applications typically use a microservices architecture, breaking the application into independently deployable services, while simply migrated applications might still employ a monolithic architecture.
- Containerization: Cloud-native applications often use containers for packaging and running services, ensuring environmental consistency and portability. Traditional cloud-migrated applications may not leverage the benefits of containers.
- DevOps and Continuous Integration/Continuous Deployment (CI/CD): Cloud-native applications often integrate DevOps culture and practices, including automated CI/CD processes, for rapid and frequent updates.

Lessons from Recent Cloud Service Failures in China in 2023
The recent cloud service failures in China underscore the importance of:

- High Availability and Disaster Recovery: The failure demonstrates that cloud applications must be designed to continue operating during outages, or at least recover quickly.
- Multi-cloud and Hybrid Cloud Strategies: Relying on a single cloud service provider may increase the risk of failure. Multi-cloud or hybrid cloud strategies can provide greater reliability.
- Performance Monitoring and Automation: Effective performance monitoring and automated failure recovery mechanisms are critical.

# Characteristics of Modern Container Application Architecture

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-admin/341931b9804eac17c5125bab8d818e81.png?qc_blockWidth=657&qc_blockHeight=209)

- Scalability: Ability to automatically adjust resources according to load.
- Portability: Containerization allows applications to run in different environments and cloud platforms.
- Resilience: Designed with the possibility of failures in mind, - maintaining stable operation during outages.
- Agility: Quick iterations and updates to respond to changing market and technological needs.
- High Reliability: Ensuring reliable operation of applications through redundant design and effective load balancing.
- Escape-proof Architecture: Preventing lock-in with specific cloud service providers, ensuring business flexibility and control.
In light of recent experiences in China, to build a fluid, efficient, and reliable cloud application architecture, enterprises need to focus not just on migrating to the cloud but on deeply adopting cloud-native principles and practices. This includes the use of microservices, containerization, DevOps culture, as well as effective performance monitoring and disaster recovery strategies.

With ongoing technological advancements, modern application architecture has become a hot topic in the software development field. This architecture is driven by four key characteristics: scalability, portability, resilience, and agility. While there are many aspects to modern architecture, these characteristics are fundamental.

- Scalability: The ability to quickly and seamlessly expand or contract to accommodate increases or decreases in global demand.
- Portability: Ease of deployment on a variety of device types and infrastructures, whether public or private clouds.
- Resilience: The ability to failover in different availability zones, clouds, or data centers in newly started clusters or virtual environments.
- Agility: The ability to update through automated CI/CD pipelines, achieving higher code release speeds and more frequent code pushes.
Our provided reference architecture is based on these principles. It's not just a theoretical concept but also provides a practical toolchain, including continuous integration and deployment with GitHub CI and infrastructure-as-code (IaC) tools like Pulumi for defining and configuring all necessary resources.


This reference architecture focuses on the following key principles:

1. Platform Agnostic Container Cloud-Native: This architecture is designed to be platform-agnostic, allowing you to deploy applications across different container orchestration platforms, such as Kubernetes (k8s) or the lightweight k3s.
2. Preference for Open Source Software (OSS): Prioritizing open-source software ensures the architecture is built on solid and widely adopted tools and technologies.
3. Everything Defined as Code: Using infrastructure as code (IaC) to define and configure all resources required by applications, ensuring consistency, reproducibility, and scalability.
4. CI/CD Automation: Implemented continuous integration and continuous deployment (CI/CD) pipelines with GitHub CI, supporting automated build, test, and deployment processes.
5. Security-Centric Development: Implementing best security practices at every stage of the architecture, including containerized builds, secure container registries like Harbor, and secure communication between services.
6. Distributed Storage: Integrating distributed storage solutions 

 ## Reference architecture:

- Pipeline: GitHub CI
- IaC Tool: Pulumi
- Code Repository: GitHub
- Container Registry: Harbor
- Monitoring: 
  - Logs: Loki
  - Tracing: Deepflow
  - Metrics: Prometheus
- Notifications: Alertmanager
- Data Storage: Clickhouse
- Visualization: Grafana
- Cluster Management:
  - Kubernetes (k8s)
  - Lightweight Kubernetes (k3s)
- Ingress: Nginx
- DNS

## Quick Start
To start using this reference architecture, follow these steps:

1. Clone this repository to your local machine.
2. Set up the necessary tools mentioned above and ensure they are correctly configured.
3. Modify the code and configuration files according to the needs of your application.
4. Use Pulumi to provide the necessary infrastructure resources defined in the IaC files.
5. Configure the CI/CD pipeline in GitHub CI to automatically trigger builds and deployments.
6. Monitor your application using the provided monitoring stack.
Deploy your application to the target cluster using k8s or k3s.
7. Set up Nginx ingress and DNS to route traffic to your application.

For more detailed guidance and examples, please refer to the documentation provided in this repository. 

https://github.com/open-source-solution-design/Modern-Container-Application-Reference-Architecture

## Contributions
We welcome community contributions to enhance this reference architecture. If you have any suggestions, improvements, or bug fixes, please feel free to submit a pull request.

# License
This project is provided under the GPLV3 license, allowing for use, copying, modification, and distribution, but must include copyright and license statements.

