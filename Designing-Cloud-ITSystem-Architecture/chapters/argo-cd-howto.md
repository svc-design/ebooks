# 概述

Argo CD 是一个用于部署和管理 Kubernetes 应用程序的开源工具。本文将介绍如何使用 Argo CD 部署和管理 Helm Charts、Helmfiles 以及来自 Git 仓库的 Helm Charts。

# 部署 Argo CD

首先，我们需要部署 Argo CD。在部署 Argo CD 时，需要确保启用了一些默认配置，包括：

自动同步（Automated Sync）：保持应用程序与 Git 存储库中的定义同步。

自愈（Self-Heal）：自动修复应用程序的状态，确保其与期望状态一致。

你可以使用以下命令部署 Argo CD，并配置 helmfiles 插件支持

```shell
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

cat <<EOF > values.yaml
global:
  domain: argocd.onwalk.net
server:
  service:
    type: NodePort
    nodePortHttp: 80
    nodePortHttps: 443
    servicePortHttp: 80
    servicePortHttps: 443
    servicePortHttpName: http
    servicePortHttpsName: https
  ingress:
    enabled: false
    ingressClassName: "nginx"
    hostname: argocd.onwalk.net
    annotations:
      nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
      nginx.ingress.kubernetes.io/backend-protocol: "HTTP"
    tls: true
repoServer:
  extraContainers:
    - name: helmfile
      image: ghcr.io/helmfile/helmfile:v0.157.0
      # Entrypoint should be Argo CD lightweight CMP server i.e. argocd-cmp-server
      command: ["/var/run/argocd/argocd-cmp-server"]
      env:
        - name: HELM_CACHE_HOME
          value: /tmp/helm/cache
        - name: HELM_CONFIG_HOME
          value: /tmp/helm/config
        - name: HELMFILE_CACHE_HOME
          value: /tmp/helmfile/cache
        - name: HELMFILE_TEMPDIR
          value: /tmp/helmfile/tmp
      securityContext:
        runAsNonRoot: true
        runAsUser: 999
      volumeMounts:
        - mountPath: /var/run/argocd
          name: var-files
        - mountPath: /home/argocd/cmp-server/plugins
          name: plugins
        # Register helmfile plugin into sidecar
        - mountPath: /home/argocd/cmp-server/config/plugin.yaml
          subPath: helmfile.yaml
          name: argocd-cmp-cm
        # Starting with v2.4, do NOT mount the same tmp volume as the repo-server container. The filesystem separation helps mitigate path traversal attacks.
        - mountPath: /tmp
          name: helmfile-tmp
  volumes:
    - name: argocd-cmp-cm
      configMap:
        name: argocd-cmp-cm
    - name: helmfile-tmp
      emptyDir: {}
configs:
  cmp:
    create: true
    plugins:
      helmfile:
        allowConcurrency: true
        discover:
          fileName: helmfile.yaml
        generate:
          command:
            - bash
            - "-c"
            - |
              if [[ -v ENV_NAME ]]; then
                helmfile -n "$ARGOCD_APP_NAMESPACE" -e $ENV_NAME template --include-crds -q
              elif [[ -v ARGOCD_ENV_ENV_NAME ]]; then
                helmfile -n "$ARGOCD_APP_NAMESPACE" -e "$ARGOCD_ENV_ENV_NAME" template --include-crds -q
              else
                helmfile -n "$ARGOCD_APP_NAMESPACE" template --include-crds -q
              fi
        lockRepo: false
EOF

helm upgrade --install argocd argo/argo-cd -n argocd -f values.yaml
```

步骤二：使用 Argo CD 部署 Helm Charts

## 部署 Helm 仓库中 Charts

要使用 Argo CD 部署 Helm Charts，可以创建一个 Application 资源，并指定 Helm Chart 的路径、存储库 URL 和目标修订版本。例如，要部署一个名为 nginx 的 Helm Chart，可以创建以下 Application 资源：

```shell
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: mysql
  namespace: argocd
spec:
  project: default
  source:
    chart: mysql
    repoURL: https://charts.onwalk.net
    targetRevision: 9.21.2
    helm:
      releaseName: mysql
  destination:
    server: "https://kubernetes.default.svc"
    namespace: itsm-dev-db
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

## 部署 Git仓库中的 Charts

要部署 Helmfiles，可以在 Application 资源中指定 Helmfile 的路径、存储库 URL 和目标修订版本。例如，要部署一个名为 my-helmfiles 的 Helmfile，可以创建以下 Application 资源：

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: itsm
  namespace: argocd
spec:
  project: default
  source:
    path: helmfiles/itsm
    repoURL: https://github.com/svc-design/gitops.git
    targetRevision: main
  destination:
    server: 'https://kubernetes.default.svc'
    namespace: itsm-dev
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

## 部署 Git仓库中的 Charts

要部署来自 Git 仓库的 Helm Charts，可以在 Application 资源中指定 Helm Chart 的路径、存储库 URL 和目标修订版本。例如，要部署一个名为 my-chart 的 Helm Chart，可以创建以下 Application 资源：

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: redis
  namespace: argocd
spec:
  project: default
  source:
    path: helm/redis
    repoURL: https://github.com/svc-design/gitops.git
    targetRevision: main
  destination:
    server: 'https://kubernetes.default.svc'
    namespace: itsm-dev
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

## 禁用ArgoCD 自动同步

1. 将 syncPolicy: {} 设置为空，即可使用 ArgoCD CLI 或者 ArgoCD UI页面手动同步，以及手动回滚
2. 自动模式无法后手动回滚

## 参考

- [https://argo-cd.readthedocs.io/en/stable/cli\_installation/](https://argo-cd.readthedocs.io/en/stable/cli_installation/)
- [https://argo-cd.readthedocs.io/en/stable/getting\_started/](https://argo-cd.readthedocs.io/en/stable/getting_started/)
- [https://christianhuth.de/deploying-helm-charts-using-argocd-and-helmfile/](https://christianhuth.de/deploying-helm-charts-using-argocd-and-helmfile/)
