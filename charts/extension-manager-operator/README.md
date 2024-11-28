# extension-manager-operator

A Helm chart for extension-manager-operator

![Version: 0.22.34](https://img.shields.io/badge/Version-0.22.34-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.66.0](https://img.shields.io/badge/AppVersion-0.66.0-informational?style=flat-square)

## Configuration

The chart supports the following configuration parameters in the table below. Additionally, default configuration parameters documented in [common/README.md](../common/README.md) are not explicitely listed in the table but are also supported.

## Values

Default configuration parameters, which can be overriden either globally or on a chart level are documented in [common/README.md](../common/README.md).

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| commonAnnotations | object | `{}` |  |
| crds.enabled | bool | `true` |  |
| image.name | string | `"ghcr.io/openmfp/extension-content-operator"` |  |
| image.tag | string | `"0.16.0"` |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 0.1.5 |
| file://../extension-manager-operator-crds | extension-manager-operator-crds | 0.1.3 |

# extension-manager-operator

![Version: 0.22.34](https://img.shields.io/badge/Version-0.22.34-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.66.0](https://img.shields.io/badge/AppVersion-0.66.0-informational?style=flat-square)

A Helm chart for extension-manager-operator

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 0.1.5 |
| file://../extension-manager-operator-crds | extension-manager-operator-crds | 0.1.3 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| commonAnnotations | object | `{}` |  |
| crds.enabled | bool | `true` |  |
| image.name | string | `"ghcr.io/openmfp/extension-content-operator"` |  |
| image.tag | string | `"0.16.0"` |  |

