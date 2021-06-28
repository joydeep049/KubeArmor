#!/bin/bash

if [ -z $1 ]; then
    echo "Usage: $0 [target namespace]"
    exit
fi

NAMESPACE=$1

KUBEARMOR_CLIENT=$(kubectl get pods -n $NAMESPACE | grep kafka-client | wc -l)
if [ $KUBEARMOR_CLIENT == 0 ]; then
    kubectl apply -n $NAMESPACE -f client-deployment.yaml
fi