# extension-manager-operator

![Version: 0.22.36](https://img.shields.io/badge/Version-0.22.36-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.77.0](https://img.shields.io/badge/AppVersion-0.77.0-informational?style=flat-square)

A Helm chart for extension-manager-operator

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../extension-manager-operator-crds | extension-manager-operator-crds | 0.1.3 |
| oci://ghcr.io/openmfp/helm-charts | common | 0.1.5 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| commonAnnotations | object | `{}` |  |
| crds.enabled | bool | `true` |  |
| image.name | string | `"ghcr.io/openmfp/extension-content-operator"` |  |
| image.tag | string | `"0.16.0"` |  |

