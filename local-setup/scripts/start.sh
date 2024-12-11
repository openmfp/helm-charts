#!/bin/bash

set -e
COL='\033[92m'
COL_RES='\033[0m'

SCRIPT_DIR=$(dirname "$0")

# Check for input argument GH_TOKEN and echo message in case not provided
if [ -z "${GH_TOKEN}" ]; then
    echo "Please provide the GitHub Token as an environment variable"
    exit 1
else
  ghToken=$GH_TOKEN
fi

ghUser=""
if [ -z "${GH_USER}" ]; then
    if ! command -v gh &> /dev/null; then
        echo "gh CLI could not be found. Either install the gh cli or set the GH_USER environmet variable with our github username."
        exit 1
    else
      ghUser=$(gh api user --jq '.login')
    fi
else
  ghUser=$GH_USER
fi

kkSecret=""
# it is possible to setup a keycloak client secret using the  KEYCLOAK_SECRET environment variable
if [ -z "${KEYCLOAK_SECRET}" ]; then
  kkSecret=openmfp-keylcoak-secret
else
  kkSecret=$KEYCLOAK_SECRET
fi


# Check if kind cluster kind is already running, exit if yes
if [ $(kind get clusters | grep -c openmfp) -gt 0 ]; then
    echo -e "$COL Kind cluster already running, using existing $COL_RES"
    kind export kubeconfig --name openmfp
else
  echo -e "$COL Creating kind cluster $COL_RES"
  kind create cluster --config $SCRIPT_DIR/../kind/kind-config.yaml --name openmfp --image=kindest/node:v1.30.2
fi

echo "$COL Installing flux $COL_RES"
helm upgrade -i -n flux-system --create-namespace flux oci://ghcr.io/fluxcd-community/charts/flux2 \
  --set imageAutomationController.create=false \
  --set imageReflectionController.create=false \
  --set kustomizeController.create=false \
  --set notificationController.create=false

echo "$COL Starting deployments $COL_RES"
kubectl apply -k $SCRIPT_DIR/../kustomize/overlays/default

echo "$COL Creating necessary secrets $COL_RES"
kubectl create secret docker-registry ghcr-credentials -n openmfp-system --docker-server=ghcr.io --docker-username=$ghUser --docker-password=$ghToken --dry-run=client -o yaml | kubectl apply -f -
kubectl create secret generic keycloak-admin -n openmfp-system --from-literal=secret=admin --dry-run=client -o yaml | kubectl apply -f -

echo "$COL waiting for istio to become ready $COL_RES"
kubectl wait --namespace istio-system \
  --for=condition=Ready helmreleases \
  --timeout=120s istio-base

kubectl wait --namespace istio-system \
  --for=condition=Ready helmreleases \
  --timeout=120s istio-istiod

kubectl wait --namespace istio-system \
  --for=condition=Ready helmreleases \
  --timeout=120s istio-gateway

echo "$COL waiting for openmfp to become ready $COL_RES"

kubectl wait --namespace openmfp-system \
  --for=condition=Ready helmreleases \
  --timeout=120s openmfp-crds

kubectl wait --namespace openmfp-system \
  --for=condition=Ready helmreleases \
  --timeout=480s openmfp

echo "You can access http://localhost:8000 to access the portal"

