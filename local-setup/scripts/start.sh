#!/bin/sh

set -e
COL='\033[92m'
COL_RES='\033[0m'

SCRIPT_DIR=$(dirname "$0")

# Check for input argument GH_TOKEN and echo message in case not provided
if [ -z "${GH_TOKEN}" ]; then
    echo "Please set the 'GITHUB_TOKEN' environment variable with a GitHub token that has 'read:packages' scope."
    exit 1
else
  ghToken=$GH_TOKEN
fi

ghUser=""
if [ -z "${GH_USER}" ]; then
    if ! command -v gh &> /dev/null; then
        echo "gh CLI could not be found. Either install the gh cli or set the GH_USER environment variable with our GitHub username."
        exit 1
    else
      ghUser=$(gh api user --jq '.login')
    fi
else
  ghUser=$GH_USER
fi

# Check if kind cluster kind is already running, exit if yes
if [ $(kind get clusters | grep -c openmfp) -gt 0 ]; then
    echo -e "${COL}[$(date '+%H:%M:%S')] Kind cluster already running, using existing ${COL_RES}"
    kind export kubeconfig --name openmfp
else
  echo "${COL}[$(date '+%H:%M:%S')] Creating kind cluster ${COL_RES}"
  kind create cluster --config $SCRIPT_DIR/../kind/kind-config.yaml --name openmfp --image=kindest/node:v1.30.2
fi

echo "${COL}[$(date '+%H:%M:%S')] Installing flux ${COL_RES}"
helm upgrade -i -n flux-system --create-namespace flux oci://ghcr.io/fluxcd-community/charts/flux2 \
  --set imageAutomationController.create=false \
  --set imageReflectionController.create=false \
  --set kustomizeController.create=false \
  --set notificationController.create=false

echo "${COL}[$(date '+%H:%M:%S')] Starting deployments ${COL_RES}"
kubectl apply -k $SCRIPT_DIR/../kustomize/overlays/default

echo "${COL}[$(date '+%H:%M:%S')] Creating necessary secrets ${COL_RES}"
kubectl create secret docker-registry ghcr-credentials -n openmfp-system --docker-server=ghcr.io --docker-username=$ghUser --docker-password=$ghToken --dry-run=client -o yaml | kubectl apply -f -

kubectl create secret generic keycloak-admin -n openmfp-system --from-literal=secret=admin --dry-run=client -o yaml | kubectl apply -f -

echo "${COL}[$(date '+%H:%M:%S')] Waiting for istio to become ready ${COL_RES}"
kubectl wait --namespace istio-system \
  --for=condition=Ready helmreleases \
  --timeout=120s istio-base

kubectl wait --namespace istio-system \
  --for=condition=Ready helmreleases \
  --timeout=120s istio-istiod

kubectl wait --namespace istio-system \
  --for=condition=Ready helmreleases \
  --timeout=120s istio-gateway

echo "${COL}[$(date '+%H:%M:%S')] Waiting for OpenMFP to become ready ${COL_RES} (this may take a while)"

kubectl wait --namespace openmfp-system \
  --for=condition=Ready helmreleases \
  --timeout=480s openmfp-crds

kubectl wait --namespace openmfp-system \
  --for=condition=Ready helmreleases \
  --timeout=480s openmfp

# Check if curl is available
if command -v curl &> /dev/null; then
  URL="http://localhost:8000"
  TIMEOUT=120
  INTERVAL=5
  END=$((SECONDS + TIMEOUT))
  while [ $SECONDS -lt $END ]; do
    HTTP_CODE=$(curl -o /dev/null -s -w "%{http_code}" $URL)
    if [ $HTTP_CODE -eq 200 ]; then
      echo "${COL}[$(date '+%H:%M:%S')] Waiting for Portal to respond...${COL_RES}"
      echo "${COL}-------------------------------------${COL_RES}"
      echo "${COL}[$(date '+%H:%M:%S')] Installation Complete ♥!${COL_RES}"
      echo "${COL}-------------------------------------${COL_RES}"
      echo "${COL}You can access the portal at: http://localhost:8000${COL_RES}"
      exit 0
    fi
    sleep $INTERVAL
  done
else
  echo "[SKIPPED] Skipped test call to portal, as curl is not available."
  echo "${COL}-------------------------------------${COL_RES}"
  echo "${COL}[$(date '+%H:%M:%S')] Installation Complete ♥!${COL_RES}"
  echo "${COL}-------------------------------------${COL_RES}"
  echo "${COL}You can access the portal at: http://localhost:8000${COL_RES}"
  exit 0
fi
echo "Timeout reached without receiving 200 response code, something went wrong. In case this does not resolve, please create a github issue in https://github.com/openmfp/helm-charts."
exit 1



