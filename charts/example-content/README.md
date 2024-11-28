# example-content

Helm Chart for the openmfp Portal

![Version: 0.110.5](https://img.shields.io/badge/Version-0.110.5-informational?style=flat-square) ![AppVersion: 0.123.0](https://img.shields.io/badge/AppVersion-0.123.0-informational?style=flat-square)

## Configuration

The chart supports the following configuration parameters in the table below. Additionally, default configuration parameters documented in [common/README.md](../common/README.md) are not explicitely listed in the table but are also supported.

## Values

Default configuration parameters, which can be overriden either globally or on a chart level are documented in [common/README.md](../common/README.md).

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.name | string | `"ghcr.io/openmfp/example-content"` | The image name |
| istio.virtualService.hosts[0] | string | `"your-host.com"` |  |
| istio.virtualService.matchers[0].match[0].uri.exact | string | `"/ui/example-content"` |  |
| istio.virtualService.matchers[0].match[1].uri.prefix | string | `"/ui/example-content/"` |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 0.1.5 |

# example-content

![Version: 0.110.5](https://img.shields.io/badge/Version-0.110.5-informational?style=flat-square) ![AppVersion: 0.123.0](https://img.shields.io/badge/AppVersion-0.123.0-informational?style=flat-square)

Helm Chart for the openmfp Portal

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 0.1.5 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.name | string | `"ghcr.io/openmfp/example-content"` | The image name |
| istio.virtualService.hosts[0] | string | `"your-host.com"` |  |
| istio.virtualService.matchers[0].match[0].uri.exact | string | `"/ui/example-content"` |  |
| istio.virtualService.matchers[0].match[1].uri.prefix | string | `"/ui/example-content/"` |  |

