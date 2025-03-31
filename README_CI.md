# GitLab CI/CD Pipeline for Blazor GitOps

This repository contains a `.gitlab-ci.yml` pipeline to:

✅ Package the Helm Chart of Blazor Workshop  
✅ Automatically publish `.tgz` and `index.yaml` to the `gh-pages` branch  
✅ Make the Helm chart available publicly for FluxCD

## Instructions

1. Create a `gh-pages` branch:
```bash
git checkout --orphan gh-pages
touch index.html
git add index.html
git commit -m "Init GitHub Pages"
git push origin gh-pages
```

2. Create a **Deploy Key** in GitHub → Settings → Deploy Keys → Add Key  
   (Give it write access)

3. Add the private key to GitLab CI/CD variables:
- Key: `GITHUB_DEPLOY_KEY`
- Value: (your private key content)

4. Push to `main` → Pipeline will:
- Package Helm chart
- Push it to `gh-pages` branch
- Make it available at:
  https://mrparsaeian.github.io/blazor-gitops/index.yaml

5. **FluxCD will auto-deploy on every change.**

---
