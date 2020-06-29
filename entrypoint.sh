#!/bin/sh

mkdir -p ~/.kube
echo "$KUBECONFIG_DATA" > ~/.kube/config

# Execute kubectl command
kubectl_result=$(kubectl $@)
status=$?

echo "::set-output name=kubectl_result::$kubectl_result"

if [ $status -ne 0 ]; then
    exit $status
fi
