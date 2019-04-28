# RocketChat k8s

## Requirements

* kubectl
* helm

## Setup

### Configure kubectl

Install the kube config from terraform output or download from DigitalOcean console.

### Install helm server

First create the RBAC account for helm tiller

```shell
kubectl create -f helm-rbac.yaml
```

Install helm server

```shell
helm init --service-account cluster-admin --wait
```

### Install ingress controller

```shell
helm install --set rbac.enabled=true stable/traefik
```

Or with values override

```shell
helm install -f traefik.override.yaml stable/traefik
```

### Optional: Install heapster

```shell
helm install --set rbac.create=true stable/heapster
```

### Install rocketchat

```shell
helm install --set rbac.enabled=true stable/rocketchat
```

Or with values override

```shell
helm install -f rocketchat.override.yaml stable/rocketchat
```
