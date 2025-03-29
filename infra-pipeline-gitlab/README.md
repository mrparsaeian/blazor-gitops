# Infra Pipeline for Blazor GitOps

This repository provisions a Kubernetes cluster and installs FluxCD for GitOps deployment of the Blazor Workshop application.

---

## 🚀 Structure

```
infra-pipeline/
├── .gitlab-ci.yml          # CI/CD pipeline
├── bootstrap.sh            # Manual trigger script
├── terraform/              # VPS provisioning
├── scripts/                # Kubespray & Flux setup
└── flux/                   # FluxCD source & kustomization
```

---

## ✅ How it works

1. Run `./bootstrap.sh` to trigger full CI/CD pipeline.
2. Pipeline will:
    - Provision VPS via Terraform
    - Install Kubernetes & FluxCD via Kubespray
3. FluxCD will automatically watch your GitHub repository and deploy Blazor Workshop app.

---

## 🎯 Usage

```bash
chmod +x bootstrap.sh
./bootstrap.sh
```

You can monitor pipeline in **GitLab → CI/CD → Pipelines**.
