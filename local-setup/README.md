# OpenMFP - Getting Started

[![test](https://github.com/fluxcd/flux2-kustomize-helm-example/workflows/test/badge.svg)](https://github.com/fluxcd/flux2-kustomize-helm-example/actions)
[![e2e](https://github.com/fluxcd/flux2-kustomize-helm-example/workflows/e2e/badge.svg)](https://github.com/fluxcd/flux2-kustomize-helm-example/actions)
[![license](https://img.shields.io/github/license/fluxcd/flux2-kustomize-helm-example.svg)](https://github.com/fluxcd/flux2-kustomize-helm-example/blob/main/LICENSE)

For this example we create a functioning local setup using kind.
The end goal is to leverage Flux and Kustomize to manage the cluster.

We will configure Flux to install, test and upgrade a demo app using
`OCIRepository` and `HelmRelease` custom resources.
Flux will monitor the Helm repository, and it will automatically
upgrade the Helm releases to their latest chart version based on semver ranges.

## Prerequisites

- [Docker](https://www.docker.com) or [podman](https://podman.io): install either docker or podman in order to run the kind cluster
- [Kind](https://kind.sigs.k8s.io/): In order to have a local kubernetes cluster you can use kind. Kind Installation: [Kind Quick Start](https://kind.sigs.k8s.io/docs/user/quick-start/)
  On macOS using Homebrew:
  ```sh
  brew install kind
  ```
- [Helm](https://helm.sh/): In order to bootstrap flux, helm is required. Checkout various ways to install helm [here](https://helm.sh/docs/intro/install/)
  On macOS using Homebrew:
  ```sh
  brew install helm
  ```

## Optional Prerequisites
- [GitHub CLI](https://cli.github.com/): The GitHub CLI is used to determine your current username. Either specify the `GH_USER` environment variable or install the [Github CLI](https://github.com/cli/cli#installation).</br>
   
  On macOS or Linux using Homebrew:
  ```sh
  brew install gh
  ```


## Bootstrap local environment

The `scripts/start.sh` contains all steps needed to bootstrap the local environment. The script will automate the following steps:
- Create kind cluster called `openmfp`
- install flux
- prepare secrets
- apply flux deployment configuration

To start the boostrapping and local installation invoke
```sh
./local-setup/scripts/start.sh
```

Once the process is completed you can access the environment using http://localhost:8000
