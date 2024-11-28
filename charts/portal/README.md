# portal

Helm Chart for the openmfp Portal

![Version: 0.69.124](https://img.shields.io/badge/Version-0.69.124-informational?style=flat-square) ![AppVersion: 0.201.0](https://img.shields.io/badge/AppVersion-0.201.0-informational?style=flat-square)

## Configuration

The chart supports the following configuration parameters in the table below. Additionally, default configuration parameters documented in [common/README.md](../common/README.md) are not explicitely listed in the table but are also supported.

## Values

Default configuration parameters, which can be overriden either globally or on a chart level are documented in [common/README.md](../common/README.md).

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| featureToggles | string | `"enableSessionAutoRefresh=true"` |  |
| http.protocol | string | `"https"` |  |
| image.name | string | `"ghcr.io/openmfp/portal"` |  |
| image.pullPolicyOverride | string | `"IfNotPresent"` |  |
| importContent | bool | `true` |  |
| validWebcomponentUrls | string | `".?"` |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 0.1.5 |

# portal

![Version: 0.69.124](https://img.shields.io/badge/Version-0.69.124-informational?style=flat-square) ![AppVersion: 0.201.0](https://img.shields.io/badge/AppVersion-0.201.0-informational?style=flat-square)

Helm Chart for the openmfp Portal

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 0.1.5 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| featureToggles | string | `"enableSessionAutoRefresh=true"` |  |
| http.protocol | string | `"https"` |  |
| image.name | string | `"ghcr.io/openmfp/portal"` |  |
| image.pullPolicyOverride | string | `"IfNotPresent"` |  |
| importContent | bool | `true` |  |
| validWebcomponentUrls | string | `".?"` |  |

