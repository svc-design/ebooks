![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-2810186/4325780476dfad5a98cc4a907fa6e8e9.jpg?qc_blockWidth=620&qc_blockHeight=620)

# Background

In today's era of cloud computing and DevOps, managing and maintaining multiple cluster environments has become a challenge. Each cluster has its unique characteristics and requirements, such as development, testing, production, etc. Effectively managing these clusters requires careful planning and the right tools.

# Objective

The objective of this document is to demonstrate how to effectively manage multiple K8S clusters, covering different environments such as development, testing, and production. The key is to leverage automation tools and best practices to achieve efficient and reliable operational processes.

Detailed description of the objectives:

1. IaC Management of Cloud Resources: Initialize Cloud resources using the Infrastructure as Code (IaC) approach. This includes configuring VPCs, firewall rules, key pairs, virtual hosts (Vhosts) for different purposes such as devops, monitor, sit, uat, and prod.
2. Use GitHub Action Pipeline to automate the configuration initialization of cluster environments (devops, monitor, sit, uat, and prod).
3. Achieving Cluster Management Objectives with GitOps/FluxCD: Integrating monitoring systems, managing alert rules, deploying applications, and configuration changes.

## Preparation

### Demo Example

| Project        | Service Provider         | Purpose/Environment | Notes                         |
|:----|:----|:----|:----|
| Cloud Account  | Google Cloud Platform (GCP) | General            | Access and manage cloud resources |
| Domain         | xx Cloud                  | Development Environment | svc-sit.ink             |
| Domain         | xx Cloud                  | Testing Environment | svc-uat.ink              |
| Domain         | xx Cloud                  | Production Environment | svc.ink                |
| Cloud DNS Service | Alibaba Cloud           | Domain Resolution  | Using xx Cloud's SaaS services |
| CI/CD          | GitHub Action             | Automated Build, Test, Deployment | Facilitating CI/CD processes |


## Configuration Repository

1. IAC\_code: [https://github.com/svc-design/iac\_modules.git](https://github.com/svc-design/iac_modules.git)
2. Playbook: [https://github.com/svc-design/playbook.git](https://github.com/svc-design/playbook.git)
3. GitOps: [https://github.com/svc-design/gitops.git](https://github.com/svc-design/gitops.git)
4. Pipeline: [https://github.com/open-source-solution-design/Modern-Container-Application-Reference-Architecture.git](https://github.com/open-source-solution-design/Modern-Container-Application-Reference-Architecture.git)

## Application Code Repository

- C: [https://github.com/scaffolding-design/c.git](https://github.com/scaffolding-design/c.git)
- GO: [https://github.com/scaffolding-design/go.git](https://github.com/scaffolding-design/go.git)
- Python: [https://github.com/scaffolding-design/python.git](https://github.com/scaffolding-design/python.git)
- Rust: [https://github.com/scaffolding-design/rust.git](https://github.com/scaffolding-design/rust.git)
- JS: [https://github.com/scaffolding-design/javascript.git](https://github.com/scaffolding-design/javascript.git)

# Deployment and Launch

## Resource Application

First, declare resource configurations in the configuration repository, followed by using the GitHub CI pipeline to automate the resource application process. Below are the detailed expansions of these two steps:

## Creating and Configuring Resource Manifests

In the iac\_modules repository, the file iac\_modules/terraform/gcp/vhost/config.yaml defines the resources needed in GCP. This YAML file details different instances for various purposes (such as devops, monitor, sit, uat, and prod), each with specific specifications like CPU type, memory size, storage size, and region.

```yaml
region: "asia-northeast1"
project_id: "cloudsvcsandbox"
bucket_name: "iac_gcp_terraform_state"
instances:
  - name: "devops"
    type: "e2-standard-4"
    zone: "asia-northeast1-a"
    image: "ubuntu-2004-lts"
    disk_size_gb: 100
    network: "custom"
    subnetwork: internet-subnet
  - name: "monitor"
    type: "e2-standard-4"
    zone: "asia-northeast1-a"
    image: "ubuntu-2004-lts"
    disk_size_gb: 100
    network: "custom"
    subnetwork: internet-subnet
  - name: "sit"
    image: "ubuntu-2004-lts"
    disk_size_gb: 100
    type: "e2-standard-2"
    zone: "asia-northeast1-a"
    network: "custom"
    subnetwork: internet-subnet
  - name: "uat"
    type: "e2-standard-4"
    zone: "asia-northeast1-a"
    image: "ubuntu-2004-lts"
    disk_size_gb: 100
    network: "custom"
    subnetwork: internet-subnet
  - name: "prod"
    type: "e2-standard-4"
    zone: "asia-northeast1-a"
    image: "ubuntu-2004-lts"
    disk_size_gb: 100
    network: "custom"
    subnetwork: internet-subnet
```

or more IAC configurations, see the [https://github.com/svc-design/iac\_modules.git](https://github.com/svc-design/iac_modules.git) repository, which includes key elements such as region and project ID, storage bucket for Terraform state management, subnet divisions, routing, firewall rules, etc.

## Resource Request CI Pipeline

In the .github/workflows/iac-pipeline-create.yml file, a GitHub CI pipeline is defined to automate the resource request declared in the config.yaml. The pipeline uses GitHub Actions to execute Terraform scripts automatically, creating and configuring resources defined in GCP.

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-admin/1922f1a2d0bf6e5b7e2f99beb1a6e8ed.png?qc_blockWidth=620&qc_blockHeight=337)

After the pipeline runs successfully, the resources are ready in the GCP console, and the basic configuration for each environment is completed.

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-admin/0fc27b195ab04ea4afbeb366aa59d50d.png?qc_blockWidth=620&qc_blockHeight=180)

## Integrating Monitoring

In the GitOps configuration repository, a directory structure is created to organize monitoring-related configuration files. For example, kube-prometheus-stack and observability-agent folders contain related configurations and Kustomize files.

- Directory Structure Example:

```yaml
apps/
├── monitor
│   ├── kube-prometheus-stack
│   │   ├── kube-state-metrics-config.yaml
│   │   ├── kustomization.yaml
│   │   ├── kustomizeconfig.yaml
│   │   ├── release.yaml
│   │   └── repository.yaml
│   └── observability-agent
│       ├── kustomization.yaml
│       └── release.yaml
```

- apps/monitor/: Contains applications and configurations related to monitoring
    - kube-prometheus-stack/: Contains configuration files for the Prometheus stack
    - observability-agent/: Contains configuration for the monitoring agent

## Distributing Monitoring Rules Using GitOps

Using kustomization.yaml files defined in the GitOps repository, you can specify which resources should be applied to specific Kubernetes clusters. For example, in clusters/sit/kustomization.yaml, resources and configurations to be applied to the SIT environment are specified.

Kustomization File Example

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - namespace.yaml
  - ../../apps/monitor/observability-agent/
  - ../../apps/monitor/kube-prometheus-stack/
```

These configurations are applied to the SIT environment's cluster within minutes after code submission. Configuration changes can be viewed via the Grafana panel showing FluxCD sync status.

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-admin/05b8266450fec5014d025d7b88adda28.png?qc_blockWidth=620&qc_blockHeight=329)

## Configuring Alerts

Managing and changing configurations, especially monitoring and alert systems in a multi-cluster environment, using the GitOps repository provides significant efficiency and convenience. This approach allows teams to use familiar Git workflows to manage complex configurations while ensuring consistency and traceability across environments.

By adding monitoring configuration files to the GitOps repository as shown:

```shell
clusters/monitor/kustomization.yaml
clusters/monitor/recording-rules-patch.yaml
clusters/monitor/alert-rules-patch.yaml
```

Using GitOps achieves several key operational goals:

- Version Control: All configuration changes are version-controlled through Git.
- Automated Deployment: Configuration changes pushed to the Git repository are automatically detected by GitOps tools (like ArgoCD or Flux) and applied to the appropriate Kubernetes clusters.
- Centralized Management: Managing configurations of multiple clusters in a centralized Git repository improves efficiency and accuracy.

Once these configurations are applied to the cluster, Grafana displays real-time data and alerts based on these rules.

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-admin/7b318791b3282c01eed4cb37692f2a0c.png?qc_blockWidth=620&qc_blockHeight=300)

## Publishing Applications

Using GitOps and Kustomize tools to manage and publish multiple applications. This method provides a highly automated and declarative way to handle the deployment and management of Kubernetes resources.

- Defining Application Configurations

```yaml
 apps/
├── c-demo
│   ├── kustomization.yaml
│   ├── namespace.yaml
│   └── release.yaml
├── go-demo
│   ├── kustomization.yaml
│   ├── namespace.yaml
│   └── release.yaml
├── js-demo
│   ├── kustomization.yaml
│   └── namespace.yaml
├── python-demo
│   ├── kustomization.yaml
│   ├── namespace.yaml
│   └── release.yaml
└── rust-demo
    ├── kustomization.yaml
    ├── namespace.yaml
    └── release.yaml
```

In the apps/ directory, each subdirectory (like c-demo, go-demo, js-demo, python-demo, rust-demo) represents an independent application. Each application directory contains its own kustomization.yaml, namespace.yaml, and release.yaml.

- kustomization.yaml: Defines the resources and configurations required for the application.
- namespace.yaml: Creates an independent namespace for each application.
- release.yaml: Deployment or other resource configurations specific to certain applications.

## Distributing Configurations Using GitOps

In clusters/sit/kustomization.yaml, the resources to be deployed in the SIT environment cluster are defined:

Kustomization File Example

```yaml
clusters/sit/kustomization.yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - namespace.yaml
  - ../../apps/monitor/observability-agent/
  - ../../apps/monitor/kube-prometheus-stack/
  - ../../apps/c-demo/
  - ../../apps/js-demo/
  - ../../apps/python-demo/
  - ../../apps/go-demo/
  - ../../apps/rust-demo/
```

Once these configurations are applied to the Kubernetes clusters by the GitOps tool, Grafana displays the deployment status and operation of these applications.

![请在此添加图片描述](https://developer.qcloudimg.com/http-save/yehe-admin/b7de789759b0b0e92dc001fd1ec8e1d7.png?qc_blockWidth=620&qc_blockHeight=293)

Subsequently, appropriate Dashboards in Grafana can be set up to monitor more application status information, such as application performance metrics, health checks and availability, alerts and events.

# Conclusion

## Pipeline: Suitable for Environment Initialization

The pipeline excels in automating the initialization and setup of infrastructure. Its main advantages include:

- Automated Setup: Pipeline automates various steps of environment setup.
One-time Tasks: Ideal for tasks like creating databases, configuring clusters.
Continuous Integration: Used for CI processes to automate code build, test, and validation.
- Quick Feedback: Provides rapid feedback to developers after code submission.

## GitOps: Suitable for Application and Configuration Changes

GitOps is more efficient in application deployment and configuration changes, especially in CD and configuration management:

- Declarative Configuration: GitOps simplifies configuration changes, version control, and auditing through declarative configuration management.
Configuration Version Control: All configuration changes are version-controlled through Git.
- Automated Synchronization: GitOps tools like Argo CD or Flux monitor Git repository changes and automatically sync configuration changes to production environments.
- Adaptability: Highly suitable for frequent, small-scale updates and changes.

The importance and complementarity of GitOps and Pipeline-based DevOps in modern software engineering are evident. Together, they not only improve the efficiency and quality of software development and operations but also provide organizations with the ability to adapt to rapid changes. Additionally, with the increase in the number of applications, adopting templated and standardized strategies helps to maintain manageability of workloads and prevent linear workload growth with scale. The above operational practices provide strong support for rapid development and operations of modern cloud-native applications.
