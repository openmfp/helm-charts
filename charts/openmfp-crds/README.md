# openmfp-crds

A chart containing CRD Definitions for OpenMFP

![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

## Requirements

| Repository                          | Name                              | Description                                        | Sources                                                                                           |
| ----------------------------------- | --------------------------------- | -------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| `oci://ghcr.io/openmfp/helm-charts` | `account-operator-crds`           | The openmfp account-operator-crds chart.           | [source](https://github.com/openmfp/helm-charts/tree/main/charts/account-operator-crds)           |
| `oci://ghcr.io/openmfp/helm-charts` | `extension-manager-operator-crds` | The openmfp extension-manager-operator-crds chart. | [source](https://github.com/openmfp/helm-charts/tree/main/charts/extension-manager-operator-crds) |

## Values
| Key                                     | Type | Default | Description |
| --------------------------------------- | ---- | ------- | ----------- |
| account-operator-crds.enabled           | bool | `true`  |             |
| extension-manager-operator-crds.enabled | bool | `true`  |             |

## Overriding Values

The values in the `defaults:` section can be reused from other charts by using the lookup function "common.getKeyValue". It implements lookup on three levels:

1. Looks for `keyOverride` in the chart's values.yaml
2. Looks for `global.key` in the chart's or parent chart's values.yaml
3. Uses the `key` in the chart's values.yaml
4. Uses the `common.defaults.key` value from the table below.

1 has precedence over 2 over 3 over 4 respectively. This approach allows for individual charts to have minimal configuration, while still being able to override parameters locally.

Example
```
1) .Values.deployment.resources.limits.memoryOverride = 4096MB
2) .Values.global.deployment.resources.limits.memory = 2048MB
3) .Values.deployment.resources.limits.memory = 1024MB
4) .Values.common.defaults.deployment.resources.limits.memory = default 512MB
```
