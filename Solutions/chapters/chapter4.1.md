
```
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
add-apt-repository -y ppa:graphics-drivers
apt install nvidia-modprobe nvidia-driver-535 nvidia-headless-535 nvidia-container-runtime
apt update
apt install nvidia-modprobe nvidia-driver-535 nvidia-headless-535 nvidia-container-runtime
```

curl -sfL https://get.k3s.io  | sh -s - --disable traefik --disable servicelb
cp /etc/rancher/k3s/k3s.yaml ~/.kube/config

ctr image pull docker.io/nvidia/cuda:12.1.1-base-ubuntu22.04
ctr run --rm -t --runc-binary=/usr/bin/nvidia-container-runtime       --env NVIDIA_VISIBLE_DEVICES=all       docker.io/nvidia/cuda:12.1.1-base-ubuntu22.04       cuda-11.6.2-base-ubuntu20.04       nvidia-smi

```
snap install --classic helm
helm repo add nvidia-device-plugin https://nvidia.github.io/k8s-device-plugin
helm repo update
helm upgrade -i nvidia-device-plugin nvidia-device-plugin/nvidia-device-plugin --version 0.15.0 --set runtimeClassName=nvidia --namespace kube-system
helm upgrade -i nvidia-device-discovery nvidia-device-plugin/gpu-feature-discovery --version 0.15.0 --namespace gpu-feature-discovery --create-namespace --set runtimeClassName=nvidia
```
# RuntimeClass.yaml

```
apiVersion: node.k8s.io/v1
kind: RuntimeClass
metadata:
  name: nvidia
handler: nvidia
```

Testing
# kubectl describe node | grep nvidia.com
# Test Gpu benchmark

```
apiVersion: v1
kind: Pod
metadata:
  name: nbody-gpu-benchmark
  namespace: default
spec:
  restartPolicy: OnFailure
  runtimeClassName: nvidia
  tolerations:
    - key: nvidia.com/gpu
      operator: Exists
      effect: NoSchedule
  containers:
    - name: cuda-container
      image: nvcr.io/nvidia/k8s/cuda-sample:nbody-cuda11.2.1
      args: ["nbody", "-gpu", "-benchmark"]
      resources:
        limits:
          nvidia.com/gpu: 1
      env:
        - name: NVIDIA_VISIBLE_DEVICES
          value: all
        - name: NVIDIA_DRIVER_CAPABILITIES
          value: all
```

# Test Cuda Job 

```
apiVersion: v1
kind: Pod
metadata:
  name: vec-add-pod
spec:
  restartPolicy: OnFailure
  runtimeClassName: nvidia
  containers:
    - name: cuda-vector-add
      # https://github.com/kubernetes/kubernetes/blob/v1.7.11/test/images/nvidia-cuda/Dockerfile
      image: "k8s.gcr.io/cuda-vector-add:v0.1"
      resources:
        limits:
          nvidia.com/gpu: 1
```


# Setup K3S && Ingress

```
cat > value.yaml <<EOF
controller:
  nginxplus: false
  ingressClass: nginx
  replicaCount: 2
  service:
    enabled: true
    type: NodePort
    externalIPs:
      - 35.73.226.236
EOF

cat > nginx-cm.yaml << EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-nginx-ingress
  namespace: ingress
data:
  use-ssl-certificate-for-ingress: "false"
  external-status-address: 35.73.226.236
  proxy-connect-timeout: 10s
  proxy-read-timeout: 10s
  client-header-buffer-size: 64k
  client-body-buffer-size: 64k
  client-max-body-size: 1000m
  proxy-buffers: 8 32k
  proxy-body-size: 1024m
  proxy-buffer-size: 32k
  proxy-connect-timeout: 10s
  proxy-read-timeout: 10s
EOF

cat > nginx-svc-patch.yaml << EOF
spec:
  ports:
  - name: http
    nodePort: 80
    port: 80
    protocol: TCP
    targetPort: 80
  - name: https
    nodePort: 443
    port: 443
    protocol: TCP
    targetPort: 443
EOF

helm repo add nginx-stable https://helm.nginx.com/stable || echo true
helm repo up
helm delete apisix -n ingress || echo true
kubectl create namespace ingress || echo true
helm upgrade --install nginx nginx-stable/nginx-ingress --version=0.15.0 --namespace ingress -f value.yaml
kubectl apply -f nginx-cm.yaml
kubectl patch svc nginx-nginx-ingress -n ingress --patch-file nginx-svc-patch.yaml
```

# Ollama Yaml

```
apiVersion: v1
kind: Namespace
metadata:
  name: ollama
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ollama
  namespace: ollama
spec:
  selector:
    matchLabels:
      name: ollama
  template:
    metadata:
      labels:
        name: ollama
    spec:
      containers:
      - name: ollama
        image: ollama/ollama:latest
        ports:
        - name: http
          containerPort: 11434
          protocol: TCP
---
apiVersion: v1
kind: Service
metadata:
  name: ollama
  namespace: ollama
spec:
  type: ClusterIP
  selector:
    name: ollama
  ports:
  - port: 80
    name: http
    targetPort: 11434
    protocol: TCP
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ollama-ingress
  namespace: ollama
spec:
  ingressClassName: nginx
  rules:
  - host: ollama.onwalk.net
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: ollama
            port:
              number: 80
```
