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
| certificate.gardener.enabled | bool | `false` |  |
| externalSecrets.accountOperatorSaKubeconfig | string | `"account-operator-sa-kubeconfig"` |  |
| fga.enabled | bool | `true` |  |
| fga.stores | list | `[]` |  |
| gateway.annotations | object | `{}` |  |
| gateway.apiVersion | string | `"networking.istio.io/v1"` |  |
| gateway.name | string | `"gateway"` |  |
| gateway.selector.istio | string | `"gateway"` |  |
| gateway.servers[0].hosts[0] | string | `"*"` |  |
| gateway.servers[0].port.name | string | `"http"` |  |
| gateway.servers[0].port.number | int | `8080` |  |
| gateway.servers[0].port.protocol | string | `"HTTP"` |  |
| kcp.enabled | bool | `false` |  |
| keycloak.enabled | bool | `false` |  |
| keycloak.hosts[0] | string | `"login.microsoftonline.com"` |  |
| rbac.clusterRole.enabled | bool | `false` |  |

