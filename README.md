# A-Log Cluster

This is a repository for integration of A-Log projects.

You can deploy all services of alog to kubernetes or test them using docker compose through the configuration files in this repository.

## Kubernetes Deployment

### Prerequisites

You need to install below tools before deploying alog to kubernetes.<br/>
You can check example helm customization files in `example-values` directory.

- Install kubernetes and kubectl (e.g. [Guide](https://kubernetes.io/docs/setup/))
- Install Ingress Controller (e.g. [nginx-ingress](https://kubernetes.github.io/ingress-nginx/deploy/))
- Optional: Install ArgoCD for continuous deployment
- Install Rook for Ceph storage [Guide](https://rook.io/docs/rook/v1.7/ceph-quickstart.htmlhttps://rook.io/docs/rook/v1.11/Getting-Started/quickstart/)

### Deploy

- Create .env file by using .env.template
- Optional: Create a namespace for alog
- Create a secret by using `bash create-secret.sh`
- Deploy all services by using below command
    
```bash
# Using kubectl
git clone https://github.com/KEA-ACCELER/alog-cluster.git
cd alog-cluster
kubectl apply -f k8s

# Using argocd
argocd app create alog --repo https://github.com/KEA-ACCELER/alog-cluster.git --path k8s --dest-server https://kubernetes.default.svc --dest-namespace default
```

## Docker Compose (for testing)

### Prerequisites

- Install docker and docker-compose

### Deploy

- Create .env file by using .env.template
- Deploy all services by using below command

```bash
git clone --recurse-submodules https://github.com/KEA-ACCELER/alog-cluster.git
cd alog-cluster
docker compose up -d
```

### Submodules update

If submodules are not updated, use below command to update them.

```bash
git submodule update --remote --merge
```

## A-Form Repositories

A-Form cluster is composed of below repositories.

- [alog-front-web](https://github.com/KEA-ACCELER/alog-front-web.git)
- [alog-service-user](https://github.com/KEA-ACCELER/alog-service-user.git)
- [alog-service-project](https://github.com/KEA-ACCELER/alog-service-project.git)
- [alog-service-issue](https://github.com/KEA-ACCELER/alog-service-issue.git)
- [alog-service-release](https://github.com/KEA-ACCELER/alog-service-release.git)
