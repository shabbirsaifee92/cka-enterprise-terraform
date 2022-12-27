#!/bin/bash
clear

tput setaf 5
echo -e "\n*******************************************************************************************************************"
echo -e "Create a new kind cluster"
echo -e "*******************************************************************************************************************"
tput setaf 2
kind create cluster --config /home/cluster-setup/kind-config.yaml

tput setaf 5
echo -e "\n*******************************************************************************************************************"
echo -e "Install Calico Network Plugin"
echo -e "*******************************************************************************************************************"
tput setaf 2
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.24.5/manifests/tigera-operator.yaml
kubectl create -f /home/cluster-setup/calico.yaml

tput setaf 5
echo -e "\n*******************************************************************************************************************"
echo -e "Setup Nginx Ingress Controller"
echo -e "*******************************************************************************************************************"
tput setaf 2

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

tput setaf 5
echo -e "\n*******************************************************************************************************************"
echo -e "Setup Layer 4 load balancer (MetalLb)"
echo -e "*******************************************************************************************************************"
tput setaf 2

/home/cluster-setup/install-metallb.sh
kubectl apply -f /home/cluster-setup/metallb-config.yaml
