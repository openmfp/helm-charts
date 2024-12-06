# openmfp-crds

A chart containing CRD Definitions for OpenMFP

![Version: 0.0.7](https://img.shields.io/badge/Version-0.0.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.0](https://img.shields.io/badge/AppVersion-0.0.0-informational?style=flat-square)

## Additional Information

The `common` chart is a library of common resources that are shared across all other charts in the repository. It has no templates, but provides helm template functions and default values that can be used by other charts.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/openmfp/helm-charts | account-operator-crds | 0.1.7 |
| oci://ghcr.io/openmfp/helm-charts | extension-manager-operator-crds | 0.1.5 |

## Values

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

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| account-operator-crds.enabled | bool | `true` |  |
| extension-manager-operator-crds.enabled | bool | `true` |  |
