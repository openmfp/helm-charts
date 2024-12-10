# portal

Helm Chart for the openmfp Portal

![Version: 0.69.167](https://img.shields.io/badge/Version-0.69.167-informational?style=flat-square) ![AppVersion: 0.237.0](https://img.shields.io/badge/AppVersion-0.237.0-informational?style=flat-square)

## Additional Information

The `common` chart is a library of common resources that are shared across all other charts in the repository. It has no templates, but provides helm template functions and default values that can be used by other charts.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/openmfp/helm-charts | common | 0.1.8 |

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
| developmentLandcsape | string | `"true"` | development landscape toggle |
| environment | string | `"local"` | environment |
| featureToggles | string | `"enableSessionAutoRefresh=true"` |  |
| frontendPort | int | `8000` | frontend port |
| http.protocol | string | `"https"` | protocol |
| image.name | string | `"ghcr.io/openmfp/portal"` |  |
| image.pullPolicyOverride | string | `"IfNotPresent"` |  |
| importContent | bool | `true` | import content toggle |
| trust.openmfp.authDomain | string | `"https://auth.provider.external/realms/openmfp/protocol/openid-connect/auth"` | auth domain (if discoveryEndpoint is not specified) |
| trust.openmfp.baseDomains | string | `"localhost"` | base domains |
| trust.openmfp.discoveryEndpoint | string | `"https://auth.provider.external/realms/master/.well-known/openid-configuration"` | discovery endpoint. If specified (different than ""), authDomain and tokenUrl are not required |
| trust.openmfp.loginAudience | string | `"openmfp"` | login audience |
| trust.openmfp.oidcClientSecretName | string | `"openmfp-client"` | oidc client secret name |
| trust.openmfp.secretKeyRef | string | `"attribute.client_secret"` | secret key reference |
| trust.openmfp.tokenUrl | string | `"https://auth.provider.external/realms/openmfp/protocol/openid-connect/token"` | token url (if discoveryEndpoint is not specified) |
| validWebcomponentUrls | string | `".?"` |  |
| virtualService.hosts | list | `["*"]` | virtual service hosts |
