# infra

The infra openmfp chart configures a number of common infrastructure components for the OpenMFP platform.

![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

## Requirements

| Repository | Name | Description | Sources |
|------------|------|-------------|---------|
| `oci://ghcr.io/openmfp/helm-charts` | `common` | The `common` chart is a library of common resources that are shared across all other charts in the repository. It has no templates, but provides helm template functions and [default values](https://github.com/openmfp/helm-charts/blob/main/charts/common/values.yaml) that can be used by other charts. |[source](https://github.com/openmfp/helm-charts/tree/main/charts/common)|
## Values
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| crossplane.enabled | bool | `true` |  |
| fga.enabled | bool | `false` |  |
| fga.stores[0].coreModuleName | string | `"module core\n\ntype user\n\ntype role\n  relations\n    define assignee: [user,user:*]\n\ntype account\n  relations\n\n    define parent: [account]\n    define owner: [role#assignee]\n    define member: [role#assignee] or owner\n\n    define get: member or get from parent\n    define update: member or update from parent\n    define delete: owner or delete from parent\n\n    # org and account specific\n    define watch: member or watch from parent\n\n    # org specific\n    define create: member or create from parent\n    define list: member or list from parent\n"` |  |
| fga.stores[0].name | string | `"tenant-demo-root"` |  |
| fga.stores[0].namespace | string | `"openmfp-system"` |  |
| fga.stores[0].tuples[0].object | string | `"role:authenticated"` |  |
| fga.stores[0].tuples[0].relation | string | `"assignee"` |  |
| fga.stores[0].tuples[0].user | string | `"user:*"` |  |
| fga.stores[0].tuples[1].object | string | `"account:demo-root"` |  |
| fga.stores[0].tuples[1].relation | string | `"member"` |  |
| fga.stores[0].tuples[1].user | string | `"role:authenticated#assignee"` |  |
| istio.enabled | bool | `true` |  |
| istio.gateway.annotations | object | `{}` |  |
| istio.gateway.apiVersion | string | `"networking.istio.io/v1"` |  |
| istio.gateway.name | string | `"gateway"` |  |
| istio.gateway.selector.istio | string | `"gateway"` |  |
| istio.gateway.servers[0].hosts[0] | string | `"*"` |  |
| istio.gateway.servers[0].port.name | string | `"http"` |  |
| istio.gateway.servers[0].port.number | int | `8000` |  |
| istio.gateway.servers[0].port.protocol | string | `"HTTP"` |  |
| istio.networking.apiVersion | string | `"networking.istio.io/v1"` | The istio apiVersion used for networking resources in this chart eg. networking.istio.io/v1, networking.istio.io/v1beta1 |
| istio.serviceEntries.https.enabled | bool | `false` | A toggle to enable the service entries for external https communication |
| istio.serviceEntries.https.hosts | list | `[]` | The list of hosts to be added to the service entry |
| kcp.clientCertIssuer | string | `"kcp-client-issuer"` |  |
| kcp.enabled | bool | `false` |  |

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
