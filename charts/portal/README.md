# portal

Helm Chart for the openmfp Portal

![Version: 0.69.123](https://img.shields.io/badge/Version-0.69.123-informational?style=flat-square) ![AppVersion: 0.200.0](https://img.shields.io/badge/AppVersion-0.200.0-informational?style=flat-square)

## Additional Information

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 0.1.5 |

## Values

Default configuration parameters, which can be overriden either globally or on a chart level are documented in [common/README.md](../common/README.md).

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| deployment.maxSurge | int | `5` |  |
| deployment.maxUnavailable | int | `0` |  |
| externalSecrets.enabled | bool | `true` |  |
| featureToggles | string | `"enableSessionAutoRefresh=true"` |  |
| http.protocol | string | `"https"` |  |
| image.name | string | `"ghcr.io/openmfp/portal"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecret | string | `"github"` |  |
| importContent | bool | `true` |  |
| istio.enabled | bool | `true` |  |
| port | int | `8080` |  |
| validWebcomponentUrls | string | `".?"` |  |

# portal

![Version: 0.69.123](https://img.shields.io/badge/Version-0.69.123-informational?style=flat-square) ![AppVersion: 0.200.0](https://img.shields.io/badge/AppVersion-0.200.0-informational?style=flat-square)

Helm Chart for the openmfp Portal

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 0.1.5 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| deployment.maxSurge | int | `5` |  |
| deployment.maxUnavailable | int | `0` |  |
| externalSecrets.enabled | bool | `true` |  |
| featureToggles | string | `"enableSessionAutoRefresh=true"` |  |
| http.protocol | string | `"https"` |  |
| image.name | string | `"ghcr.io/openmfp/portal"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecret | string | `"github"` |  |
| importContent | bool | `true` |  |
| istio.enabled | bool | `true` |  |
| port | int | `8080` |  |
| validWebcomponentUrls | string | `".?"` |  |

