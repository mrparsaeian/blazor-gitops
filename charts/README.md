# Blazor Workshop Helm Charts with Sentry Integration

This repository contains Helm charts to deploy the **Blazor Workshop Application** and **Sentry for error tracking**.

---

## 📂 Structure

```
charts/
├── frontend/      # Blazor Workshop Frontend
├── backend/       # Blazor Workshop Backend
└── sentry/        # Sentry Error Tracking
```

---

## 🚀 URLs

| Component   | URL                                           |
|------------|-----------------------------------------------|
| Frontend   | https://parsaeian.ponya.ir/frontend           |
| Backend    | https://parsaeian.ponya.ir/endpoints          |
| Sentry     | https://sentry.parsaeian.ponya.ir             |

---

## ⚙️ Deployment

To deploy all components:

```bash
helm install blazor-frontend ./charts/frontend -f values-production.yaml
helm install blazor-backend ./charts/backend -f values-production.yaml
helm install sentry ./charts/sentry -f values-production.yaml
```

---

## 🧩 Sentry Integration

The Blazor frontend is configured to send error logs and source maps to Sentry.

To use source mapping:

1. Set your Sentry DSN in the frontend app configuration.
2. Add build pipeline to upload source maps to Sentry.

Example:

```bash
sentry-cli releases new "1.0.0"
sentry-cli releases files "1.0.0" upload-sourcemaps ./wwwroot
sentry-cli releases finalize "1.0.0"
```

---

## 📄 values-production.yaml

Customize production values:

```yaml
frontend:
  image:
    tag: latest

backend:
  image:
    tag: latest

sentry:
  email: admin@ponya.ir
  ingress:
    host: sentry.parsaeian.ponya.ir
```

---

## 🎯 Next

- Add this deployment to your **FluxCD GitOps repo**.
- Trigger deployments via CI/CD pipeline.

