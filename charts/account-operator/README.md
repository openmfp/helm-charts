# account-operator

A Helm chart for Kubernetes

![Version: 0.4.20](https://img.shields.io/badge/Version-0.4.20-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.106.0](https://img.shields.io/badge/AppVersion-0.106.0-informational?style=flat-square)

## Additional Information

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../account-operator-crds | account-operator-crds | 0.1.5 |
| file://../common | common | 0.1.5 |

## Values

Default configuration parameters, which can be overriden either globally or on a chart level are documented in [common/README.md](../common/README.md).

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| crds.enabled | bool | `true` |  |
| deployment.resources.limits.cpuOverride | string | `"260m"` |  |
| deployment.resources.limits.memoryOverride | string | `"512Mi"` |  |
| deployment.resources.requests.cpuOverride | string | `"150m"` |  |
| deployment.resources.requests.memoryOverride | string | `"128Mi"` |  |
| deployment.revisionHistoryLimit | int | `3` |  |
| deployment.specTemplate.annotations | object | `{}` |  |
| deployment.specTemplate.labels | object | `{}` |  |
| image.name | string | `"ghcr.io/openmfp/account-operator"` |  |
| image.tag | string | `"latest"` |  |
| kcp.enabled | bool | `false` |  |
| kcp.virtualWorkspaceUrl | string | `""` |  |
| kubeconfigSecret | string | `""` |  |
| logLevel | string | `"warn"` |  |
| security.mountServiceAccountToken | bool | `false` |  |
| subroutines.extension.enabled | bool | `true` |  |
| subroutines.extensionReady.enabled | bool | `true` |  |
| subroutines.fga.creatorRelation | string | `"owner"` |  |
| subroutines.fga.enabled | bool | `true` |  |
| subroutines.fga.grpcAddr | string | `""` |  |
| subroutines.fga.objectType | string | `"account"` |  |
| subroutines.fga.parentRelation | string | `"parent"` |  |
| subroutines.fga.rootNamespace | string | `"openmfp-root"` |  |
| subroutines.namespace.enabled | bool | `true` |  |
| webhooks.certDir | string | `"/certs"` |  |
| webhooks.enabled | bool | `false` |  |

# account-operator

![Version: 0.4.20](https://img.shields.io/badge/Version-0.4.20-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.106.0](https://img.shields.io/badge/AppVersion-0.106.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../account-operator-crds | account-operator-crds | 0.1.5 |
| file://../common | common | 0.1.5 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| crds.enabled | bool | `true` |  |
| deployment.resources.limits.cpuOverride | string | `"260m"` |  |
| deployment.resources.limits.memoryOverride | string | `"512Mi"` |  |
| deployment.resources.requests.cpuOverride | string | `"150m"` |  |
| deployment.resources.requests.memoryOverride | string | `"128Mi"` |  |
| deployment.revisionHistoryLimit | int | `3` |  |
| deployment.specTemplate.annotations | object | `{}` |  |
| deployment.specTemplate.labels | object | `{}` |  |
| image.name | string | `"ghcr.io/openmfp/account-operator"` |  |
| image.tag | string | `"latest"` |  |
| kcp.enabled | bool | `false` |  |
| kcp.virtualWorkspaceUrl | string | `""` |  |
| kubeconfigSecret | string | `""` |  |
| logLevel | string | `"warn"` |  |
| security.mountServiceAccountToken | bool | `false` |  |
| subroutines.extension.enabled | bool | `true` |  |
| subroutines.extensionReady.enabled | bool | `true` |  |
| subroutines.fga.creatorRelation | string | `"owner"` |  |
| subroutines.fga.enabled | bool | `true` |  |
| subroutines.fga.grpcAddr | string | `""` |  |
| subroutines.fga.objectType | string | `"account"` |  |
| subroutines.fga.parentRelation | string | `"parent"` |  |
| subroutines.fga.rootNamespace | string | `"openmfp-root"` |  |
| subroutines.namespace.enabled | bool | `true` |  |
| webhooks.certDir | string | `"/certs"` |  |
| webhooks.enabled | bool | `false` |  |

