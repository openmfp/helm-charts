# openmfp

The OpenMFP chart for Kubernetes

![Version: 0.0.13](https://img.shields.io/badge/Version-0.0.13-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.0](https://img.shields.io/badge/AppVersion-0.0.0-informational?style=flat-square)

## Configuration

The chart supports the following configuration parameters in the table below. Additionally, default configuration parameters documented in [common/README.md](../common/README.md) are not explicitely listed in the table but are also supported.

## Values

Default configuration parameters, which can be overriden either globally or on a chart level are documented in [common/README.md](../common/README.md).

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| components.example-content.enabled | bool | `false` |  |
| components.portal.enabled | bool | `true` |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/openmfp/helm-charts | example-content | 0.110.4 |
| oci://ghcr.io/openmfp/helm-charts | portal | 0.69.122 |

# openmfp

![Version: 0.0.13](https://img.shields.io/badge/Version-0.0.13-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.0](https://img.shields.io/badge/AppVersion-0.0.0-informational?style=flat-square)

The OpenMFP chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/openmfp/helm-charts | example-content | 0.110.4 |
| oci://ghcr.io/openmfp/helm-charts | portal | 0.69.122 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| components.example-content.enabled | bool | `false` |  |
| components.portal.enabled | bool | `true` |  |

