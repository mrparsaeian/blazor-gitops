# 🚀 Blazor Workshop GitOps - Quick Deployment Guide

## 🧩 System Architecture

```
[GitLab CI/CD] → [Terraform] → [Hetzner VPS]
                              ↓
                       [Kubespray + Helm + FluxCD]
                              ↓
                 [Blazor Workshop + Sentry] → Ingress URLs
```

---

## ✅ Components Overview

| Component | Function |
|---------|---------|
| **Terraform** | Provisions VPS on Hetzner |
| **Kubespray** | Installs Kubernetes Cluster |
| **Helm** | Manages Blazor & Sentry deployments |
| **FluxCD** | GitOps Engine - watches Git repo and deploys |
| **Sentry** | Error Tracking & Source Mapping |

---

## 🌐 Access URLs

| Service | URL |
|------|-----|
| Frontend | https://parsaeian.ponya.ir/frontend |
| Backend | https://parsaeian.ponya.ir/endpoints |
| Sentry | https://sentry.parsaeian.ponya.ir |

---

## 🚀 How to Deploy

### Step 1 — Prepare

✅ Add the following variables to your **Infra GitLab Repo → Settings → CI/CD → Variables**:

| Key | Value |
|---|---|
| `HCLOUD_TOKEN` | Your Hetzner API Token |
| `HCLOUD_SSH_KEY_ID` | Your SSH Key ID in Hetzner |

✅ Update DNS records to point your domain to VPS public IP

---

### Step 2 — Push & Run

1. Clone **infra-pipeline** repo:
   ```bash
   git clone <infra-pipeline-repo>
   cd infra-pipeline
   git push
   ```

2. GitLab pipeline will automatically:
   - Provision VPS
   - Install Kubernetes, Helm & FluxCD
   - Deploy Blazor Frontend, Backend & Sentry

---

### Step 3 — Verify Deployment

Run:

```bash
kubectl get pods -n flux-system
kubectl get pods
```

Access your services via:

- https://parsaeian.ponya.ir/frontend
- https://parsaeian.ponya.ir/endpoints
- https://sentry.parsaeian.ponya.ir

---

### 🎯 Notes

- Blazor & Backend images can be updated → Flux will auto-deploy
- Ingress TLS & Source Map setup are pre-configured
- To destroy infra:
  ```bash
  cd terraform
  terraform destroy
  ```
