# example-content

Helm Chart for the openmfp Portal

## Requirements

| Repository | Name | Description | Sources |
|------------|------|-------------|---------|
| `oci://ghcr.io/openmfp/helm-charts` | `common` | The `common` chart is a library of common resources that are shared across all other charts in the repository. It has no templates, but provides helm template functions and [default values](https://github.com/openmfp/helm-charts/blob/main/charts/common/values.yaml) that can be used by other charts. |[source](https://github.com/openmfp/helm-charts/tree/main/charts/common)|
## Values
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| contentConfigurations.ui | object | `{"enabled":true,"internalUrl":"http://openmfp-example-content.openmfp-system.svc.cluster.local:8080/ui/assets/config.json","url":"http://localhost:8000/ui/example-content/ui/assets/config.json"}` | This content configuration enables a basic homepage in the portal |
| contentConfigurations.wc.enabled | bool | `true` |  |
| contentConfigurations.wc.internalUrl | string | `"http://openmfp-example-content.openmfp-system.svc.cluster.local:8080/wc/assets/config.json"` |  |
| contentConfigurations.wc.url | string | `"http://localhost:8000/ui/example-content/wc/assets/config.json"` |  |
| contentProtocolDomain | string | `"https://example-content.some-domain.com"` |  |
| image.name | string | `"ghcr.io/openmfp/example-content"` | The image name |
| istio.enabled | bool | `true` |  |
| istio.virtualService.hosts[0] | string | `"*"` |  |
| istio.virtualService.matchers[0].match[0].uri.prefix | string | `"/ui/example-content"` |  |
| istio.virtualService.matchers[0].rewrite.uri | string | `"/"` |  |

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
