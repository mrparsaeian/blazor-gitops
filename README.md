# Blazor GitOps Deployment Repository

This repository contains the GitOps setup for deploying the **Blazor Workshop Application** and **Sentry Monitoring** using **FluxCD** and **Helm Charts**.

---

## 📂 Repository Structure

```
blazor-gitops-repo/
├── charts/
│   ├── frontend/       # Blazor Frontend Helm chart
│   ├── backend/        # Blazor Backend Helm chart
│   └── sentry/         # Sentry Helm chart
├── flux-helmrelease.yaml  # Flux HelmRelease definitions
├── values-production.yaml # Production values configuration
├── .gitignore
└── README.md
```

---

## 🚀 URLs

| Service  | URL                                          |
|--------|----------------------------------------------|
| Frontend | https://parsaeian.ponya.ir/frontend        |
| Backend  | https://parsaeian.ponya.ir/endpoints       |
| Sentry   | https://sentry.parsaeian.ponya.ir          |

---

## 🔥 How it works

FluxCD watches this repository and automatically deploys:
- **Blazor Workshop Frontend**
- **Blazor Workshop Backend**
- **Sentry for Error Tracking**

All configuration is in `flux-helmrelease.yaml` and `values-production.yaml`.

---

## 🎯 Deployment

No need to run anything manually.  
When you push changes to:
- Helm charts
- `values-production.yaml`
- `flux-helmrelease.yaml`

**FluxCD will automatically reconcile and deploy to Kubernetes.**

---

## 📄 Notes

- Infrastructure provisioning and Kubernetes installation are managed in a separate **GitLab repo** (`infra-pipeline`).
- This repo is only for **Application GitOps Deployment**.

---

Happy GitOps! 🚀
