# common

A Helm chart for Kubernetes

![Version: 0.1.6](https://img.shields.io/badge/Version-0.1.6-informational?style=flat-square) ![Type: library](https://img.shields.io/badge/Type-library-informational?style=flat-square)

## Additional Information

The `common` chart is a library of common resources that are shared across all other charts in the repository. It has no templates, but provides helm template functions and default values that can be used by other charts.

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
| defaults.certManager.enabled | bool | `false` | toggle to enable/disable cert-manager |
| defaults.deployment.maxSurge | int | `5` | maxSurge |
| defaults.deployment.maxUnavailable | int | `0` | maxUnavailable |
| defaults.deployment.resources.limits | object | `{"cpu":"100m","memory":"512Mi"}` | cpu and memory limits for the deployment |
| defaults.deployment.resources.requests | object | `{"cpu":"40m","memory":"50Mi"}` | cpu and memory requests for the deployment |
| defaults.deployment.revisionHistoryLimit | int | `3` | deployment revision history limit |
| defaults.deployment.strategy | string | `"RollingUpdate"` | deployment strategy |
| defaults.externalSecrets.enabled | bool | `true` | toggle to enable/disable external-secrets |
| defaults.health.liveness | object | `{"failureThreshold":1,"path":"/healthz"}` | liveness probe parameters |
| defaults.health.periodSeconds | int | `10` | health period |
| defaults.health.port | int | `8081` | health port |
| defaults.health.readiness | object | `{"initialDelaySeconds":5,"path":"/readyz","periodSeconds":10}` | readiness probe parameters |
| defaults.health.startup | object | `{"failureThreshold":30,"path":"/readyz"}` | startup probe parameters |
| defaults.imagePullPolicy | string | `"Always"` | imagePullPolicy is the policy to use when pulling images for all charts |
| defaults.imagePullSecret | string | `"github"` | imagePullSecret is the name of the secret that holds the docker registry credentials |
| defaults.istio.enabled | bool | `false` | toggle to enable/disable istio |
| defaults.istio.gateway.name | string | `"gateway"` | name of the gateway |
| defaults.metrics.port | int | `8080` | metrics port |
| defaults.port | int | `8080` | service port |
| defaults.securityContext.fsGroup | int | `2000` | fsGroup id to run the container |
| defaults.securityContext.runAsGroup | int | `3000` | group id to run the container |
| defaults.securityContext.runAsUser | int | `1000` | user id to run the container |
