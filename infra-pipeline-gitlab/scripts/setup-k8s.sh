#!/bin/bash
set -e

VPS_IP=$1
SSH_USER=root

ssh-keyscan -H $VPS_IP >> ~/.ssh/known_hosts

ssh $SSH_USER@$VPS_IP <<'EOF'
  apt update && apt install -y python3-pip python3-venv git curl
  git clone https://github.com/kubernetes-sigs/kubespray.git
  cd kubespray
  python3 -m venv venv
  source venv/bin/activate
  pip install -r requirements.txt
  cp -rfp inventory/sample inventory/mycluster
  CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py $(hostname -I | awk '{print $1}')
  ansible-playbook -i inventory/mycluster/hosts.yaml -u root --become --become-user=root cluster.yml

  curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
  curl -s https://fluxcd.io/install.sh | bash
  flux install
EOF
