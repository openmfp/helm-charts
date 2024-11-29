# infra

A Helm chart for Kubernetes

![Version: 0.57.2](https://img.shields.io/badge/Version-0.57.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

## Configuration

The chart supports the following configuration parameters in the table below. Additionally, default configuration parameters documented in [common/README.md](../common/README.md) are not explicitely listed in the table but are also supported.

## Values

Default configuration parameters, which can be overriden either globally or on a chart level are documented in [common/README.md](../common/README.md).

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| auth | string | `nil` |  |
| certificate.gardener.enabled | bool | `false` |  |
| clusterRole.enabled | bool | `false` |  |
| externalSecrets.accountOperatorSaKubeconfig | string | `"account-operator-sa-kubeconfig"` |  |
| gateway.annotations | object | `{}` |  |
| gateway.apiVersion | string | `"networking.istio.io/v1"` |  |
| gateway.name | string | `"gateway"` |  |
| gateway.selector.istio | string | `"gateway"` |  |
| gateway.servers[0].hosts[0] | string | `"*"` |  |
| gateway.servers[0].port.name | string | `"http"` |  |
| gateway.servers[0].port.number | int | `8080` |  |
| gateway.servers[0].port.protocol | string | `"HTTP"` |  |
| kcp.enabled | bool | `false` |  |
| stores | list | `[]` |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 0.1.5 |

# infra

![Version: 0.57.2](https://img.shields.io/badge/Version-0.57.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 0.1.5 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| auth | string | `nil` |  |
| certificate.gardener.enabled | bool | `false` |  |
| clusterRole.enabled | bool | `false` |  |
| externalSecrets.accountOperatorSaKubeconfig | string | `"account-operator-sa-kubeconfig"` |  |
| gateway.annotations | object | `{}` |  |
| gateway.apiVersion | string | `"networking.istio.io/v1"` |  |
| gateway.name | string | `"gateway"` |  |
| gateway.selector.istio | string | `"gateway"` |  |
| gateway.servers[0].hosts[0] | string | `"*"` |  |
| gateway.servers[0].port.name | string | `"http"` |  |
| gateway.servers[0].port.number | int | `8080` |  |
| gateway.servers[0].port.protocol | string | `"HTTP"` |  |
| kcp.enabled | bool | `false` |  |
| stores | list | `[]` |  |

