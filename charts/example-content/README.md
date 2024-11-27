# example-content

![Version: 0.110.4](https://img.shields.io/badge/Version-0.110.4-informational?style=flat-square) ![AppVersion: 0.123.0](https://img.shields.io/badge/AppVersion-0.123.0-informational?style=flat-square)

Helm Chart for the openmfp Portal

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/openmfp/helm-charts | common | 0.1.4 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| deployment.maxSurge | int | `5` |  |
| deployment.maxUnavailable | int | `0` |  |
| image.name | string | `"ghcr.io/openmfp/example-content"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.pullSecret | string | `"github"` |  |
| istio.enabled | bool | `true` |  |
| istio.gateway.name | string | `"gateway"` |  |
| istio.virtualService.hosts[0] | string | `"your-host.com"` |  |
| istio.virtualService.matchers[0].match[0].uri.exact | string | `"/ui/example-content"` |  |
| istio.virtualService.matchers[0].match[1].uri.prefix | string | `"/ui/example-content/"` |  |
| port | int | `8080` |  |

