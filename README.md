# cka-enterprise-terraform
Setup a remote server with Ubuntu 20 and install KinD

## Setup the complete kubernetes cluster

Run the ansible playbook to install important packages and initialize kubernetes cluster `ansible-playbook -i ansible/hosts.ini --private-key=<private-key-path> ansible/playbook.yaml`

## The playbook will do the following for kubernetes cluster to work

1. Install Kind

2. Install helm, jq, kubetctx, and k9s (optional)

3. Create a new kind cluster named `cluster01`

4. Install Calico Network Plugin

5. Setup Nginx Ingress Controller

6. Setup Layer 4 load balancer (MetalLb)

Now we should have a fully functional 2 node kubernetes cluster running calico with ingress controller.
