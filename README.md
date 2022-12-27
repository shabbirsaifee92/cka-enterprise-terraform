# cka-enterprise-terraform
Setup a remote server with Ubuntu 20 and install KinD

## Steps to setup the complete kubernetes cluster

1. Run the ansible playbook to install docker, kind and other packages `ansible-playbok --private-key <private-key> ansible/playbook.yaml`

2. Create a new kind cluster
    `kind cluster create --config cluster-setup/kind-config.yaml`

3. Install Calico Network Plugin
    `kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.5/manifests/tigera-operator.yaml`
    `kubectl create -f cluster-setup/calico.yaml`

4. Setup Nginx Ingress Controller
    `kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind deploy.yaml namespace/ingress-nginx created`

Now we should have a fully functional 2 node kubernetes cluster running calico with ingress controller.
