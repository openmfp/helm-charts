# account-operator

A Helm chart for Kubernetes

![Version: 0.4.21](https://img.shields.io/badge/Version-0.4.21-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.106.0](https://img.shields.io/badge/AppVersion-0.106.0-informational?style=flat-square)

## Configuration

The chart supports the following configuration parameters in the table below. Additionally, default configuration parameters documented in [common/README.md](../common/README.md) are not explicitely listed in the table but are also supported.

## Values

Default configuration parameters, which can be overriden either globally or on a chart level are documented in [common/README.md](../common/README.md).

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| crds.enabled | bool | `true` | Enable CRDs |
| deployment.specTemplate.annotations | object | `{}` | The annotations for the deployment |
| deployment.specTemplate.labels | object | `{}` | The labels for the deployment |
| image.name | string | `"ghcr.io/openmfp/account-operator"` | The image repository |
| image.tag | string | `"latest"` | The image tag |
| kcp | object | `{"enabled":false,"virtualWorkspaceUrl":""}` | The KCP configuration |
| kcp.enabled | bool | `false` | Enable KCP |
| kcp.virtualWorkspaceUrl | string | `""` | The URL for the virtual workspace |
| kubeconfigSecret | string | `""` | The secret for kubeconfig |
| logLevel | string | `"warn"` | The log level |
| security.mountServiceAccountToken | bool | `false` | Mount the service account token |
| subroutines.extension.enabled | bool | `true` | Enable extension subroutines |
| subroutines.extensionReady.enabled | bool | `true` | Enable extension ready subroutines |
| subroutines.fga.creatorRelation | string | `"owner"` | The creator relation for FGA |
| subroutines.fga.enabled | bool | `true` | Enable FGA subroutines |
| subroutines.fga.grpcAddr | string | `""` | The gRPC address for FGA |
| subroutines.fga.objectType | string | `"account"` | The object type for FGA |
| subroutines.fga.parentRelation | string | `"parent"` | The parent relation for FGA |
| subroutines.fga.rootNamespace | string | `"openmfp-root"` | The root namespace for FGA |
| subroutines.namespace.enabled | bool | `true` | Enable namespace subroutines |
| webhooks.certDir | string | `"/certs"` | The directory for webhook certificates |
| webhooks.enabled | bool | `false` | Enable webhooks |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../account-operator-crds | account-operator-crds | 0.1.6 |
| file://../common | common | 0.1.5 |

# account-operator

![Version: 0.4.21](https://img.shields.io/badge/Version-0.4.21-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.106.0](https://img.shields.io/badge/AppVersion-0.106.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../account-operator-crds | account-operator-crds | 0.1.6 |
| file://../common | common | 0.1.5 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| crds.enabled | bool | `true` | Enable CRDs |
| deployment.specTemplate.annotations | object | `{}` | The annotations for the deployment |
| deployment.specTemplate.labels | object | `{}` | The labels for the deployment |
| image.name | string | `"ghcr.io/openmfp/account-operator"` | The image repository |
| image.tag | string | `"latest"` | The image tag |
| kcp | object | `{"enabled":false,"virtualWorkspaceUrl":""}` | The KCP configuration |
| kcp.enabled | bool | `false` | Enable KCP |
| kcp.virtualWorkspaceUrl | string | `""` | The URL for the virtual workspace |
| kubeconfigSecret | string | `""` | The secret for kubeconfig |
| logLevel | string | `"warn"` | The log level |
| security.mountServiceAccountToken | bool | `false` | Mount the service account token |
| subroutines.extension.enabled | bool | `true` | Enable extension subroutines |
| subroutines.extensionReady.enabled | bool | `true` | Enable extension ready subroutines |
| subroutines.fga.creatorRelation | string | `"owner"` | The creator relation for FGA |
| subroutines.fga.enabled | bool | `true` | Enable FGA subroutines |
| subroutines.fga.grpcAddr | string | `""` | The gRPC address for FGA |
| subroutines.fga.objectType | string | `"account"` | The object type for FGA |
| subroutines.fga.parentRelation | string | `"parent"` | The parent relation for FGA |
| subroutines.fga.rootNamespace | string | `"openmfp-root"` | The root namespace for FGA |
| subroutines.namespace.enabled | bool | `true` | Enable namespace subroutines |
| webhooks.certDir | string | `"/certs"` | The directory for webhook certificates |
| webhooks.enabled | bool | `false` | Enable webhooks |

