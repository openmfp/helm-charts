# infra

The infra openmfp chart configures a number of common infrastructure components for the OpenMFP platform.

![Version: 0.59.0](https://img.shields.io/badge/Version-0.59.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

## Additional Information

The `common` chart is a library of common resources that are shared across all other charts in the repository. It has no templates, but provides helm template functions and default values that can be used by other charts.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/openmfp/helm-charts | common | 0.1.8 |

## Values
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fga.enabled | bool | `true` | An experimental toggle to enable the FGA integration |
| fga.stores | list | `[]` | The list of FGA stores to be created |
| istio.gateway.annotations | object | `{}` | Annotations to be applied to the istio gateway |
| istio.gateway.apiVersion | string | `nil` | The istio apiVersion of the gateway resource eg, networking.istio.io/v1, networking.istio.io/v1beta1 |
| istio.gateway.name | string | `"gateway"` | The name of the istio gateway resource |
| istio.gateway.selector.istio | string | `"gateway"` | The istio ingress gateway selector |
| istio.gateway.servers | list | `[{"hosts":["*"],"port":{"name":"http","number":8080,"protocol":"HTTP"}}]` | The "servers" section of the istio gateway. By default it is configured for a local kind setup. Adjust to be a https port for productive deployments |
| istio.networking.apiVersion | string | `"networking.istio.io/v1"` | The istio apiVersion used for networking resources in this chart eg. networking.istio.io/v1, networking.istio.io/v1beta1 |
| istio.serviceEntries.https.enabled | bool | `false` | A toggle to enable the service entries for external https communication |
| istio.serviceEntries.https.hosts | list | `[]` | The list of hosts to be added to the service entry |

## Overriding Values

The values in the `defaults:` section can be reused from other charts by using the lookup function "common.getKeyValue". It implements lookup on three levels:

1. Looks for `keyOverride` in the chart's values.yaml
2. Looks for `global.key` in the chart's or parent chart's values.yaml
3. Uses the `key` in the chart's values.yaml
4. Uses the `common.defaults.key` value from the table below.

1 has precendence over 2 over 3 over 4 respectively. This approach allows for individual charts to have minimal configuration, while still being able to override parameters locally.

Example
```
1) .Values.deployment.resources.limits.memoryOveride =  4096MB
2) .Values.global.deployment.resources.limits.memory =  2048MB
3) .Values.deployment.resources.limits.memory =  1024MB
4) .Values.common.defaults.deployment.resources.limits.memory = default 512MB
```
