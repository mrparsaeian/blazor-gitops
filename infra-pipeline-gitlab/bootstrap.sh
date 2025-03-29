#!/bin/bash
set -e

# === CONFIG ===
GITLAB_PROJECT_ID="68473100"
TRIGGER_TOKEN="your-trigger-token"

# === Trigger Full Pipeline ===
echo "🚀 Triggering Full Infrastructure Bootstrap..."
curl -X POST "https://gitlab.com/api/v4/projects/$GITLAB_PROJECT_ID/trigger/pipeline?token=$TRIGGER_TOKEN"

echo "✅ Pipeline Triggered! Check GitLab CI/CD → Pipelines."
