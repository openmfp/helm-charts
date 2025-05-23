# keycloak

A Helm chart to deploy keycloak as OIDC provider in openmfp

![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

## Requirements

| Repository | Name | Description | Sources |
|------------|------|-------------|---------|
| `oci://registry-1.docker.io/bitnamicharts` | `keycloak` | The open source bitnami keycloak chart to deploy keycloak. | [source](https://github.com/bitnami/charts/tree/main/bitnami/keycloak) |
| `oci://ghcr.io/openmfp/helm-charts` | `common` | The `common` chart is a library of common resources that are shared across all other charts in the repository. It has no templates, but provides helm template functions and [default values](https://github.com/openmfp/helm-charts/blob/main/charts/common/values.yaml) that can be used by other charts. |[source](https://github.com/openmfp/helm-charts/tree/main/charts/common)|
## Values
| Key | Type | Default | Description |
|-----|------|---------|-------------|
| crossplane.clients.openmfp.name | string | `"OpenMFP"` | name of the client |
| crossplane.clients.openmfp.validRedirectUris | list | `["http://localhost:8000/callback*","http://localhost:4300/callback*"]` | valid redirect uris for the client |
| crossplane.clients.openmfp.validRedirectUris[0] | string | `"http://localhost:8000/callback*"` | keycloak callback url |
| crossplane.enabled | bool | `true` | toggle to enable/disable crossplane |
| crossplane.identityProviders | object | `{}` |  |
| crossplane.providerConfig | object | `{"name":"keycloak-provider-config","namespace":"openmfp-system"}` | crossplane provider config |
| crossplane.providerConfig.name | string | `"keycloak-provider-config"` | name of the client |
| crossplane.providerConfig.namespace | string | `"openmfp-system"` | client namespace |
| crossplane.realm | object | `{"accessTokenLifespan":"8h","displayName":"OpenMFP","name":"openmfp","registrationAllowed":true}` | crossplane realm config |
| crossplane.realm.accessTokenLifespan | string | `"8h"` | realm access token lifespan |
| crossplane.realm.displayName | string | `"OpenMFP"` | realm display name |
| crossplane.realm.name | string | `"openmfp"` | realm name |
| crossplane.realm.registrationAllowed | bool | `true` | realm registration allowed |
| crossplane.trustedAudiences | list | `[]` |  |
| debug | bool | `false` | debug mode |
| domain | object | `{"name":"openmfp.org","pathPrefix":"/keycloak"}` | domain configuration |
| domain.name | string | `"openmfp.org"` | domain name |
| domain.pathPrefix | string | `"/keycloak"` | path prefix |
| externalSecrets | object | `{"keycloakAdminRemoteRef":"","postgres-adminRemoteRef":""}` | external secrets configuration |
| externalSecrets.keycloakAdminRemoteRef | string | `""` | keycloak admin secret |
| externalSecrets.postgres-adminRemoteRef | string | `""` | postgres admin secret |
| istio.https.port | int | `8443` |  |
| istio.virtualservice.hosts | list | `["*"]` | istio virtual service hosts |
| job | object | `{"annotations":{"argocd.argoproj.io/hook":"PostSync"},"serviceAccount":"keycloak-client-creation"}` | job configuration |
| job.annotations | object | `{"argocd.argoproj.io/hook":"PostSync"}` | custom job annotations |
| job.serviceAccount | string | `"keycloak-client-creation"` | job ServiceAccount name |
| keycloak | object | `{"auth":{"adminUser":"keycloak-admin","existingSecret":"keycloak-admin","passwordSecretKey":"secret"},"extraEnvVars":[{"name":"KEYCLOAK_USER","value":"keycloak-admin"},{"name":"KEYCLOAK_PASSWORD","valueFrom":{"secretKeyRef":{"key":"secret","name":"keycloak-admin"}}},{"name":"JAVA_OPTS_APPEND","value":"-Djgroups.dns.query=openmfp-keycloak-headless.openmfp-system.svc.cluster.local"}],"httpRelativePath":"/keycloak/","postgresql":{"auth":{"existingSecret":"","secretKeys":{"adminPasswordKey":"password","userPasswordKey":"password"},"username":"keycloak"},"nameOverride":"postgresql-keycloak","primary":{"resourcesPreset":"none"}}}` | configuration passed to the child 'keyclaok' chart https://github.com/bitnami/charts/tree/main/bitnami/keycloak |
| keycloak.auth.adminUser | string | `"keycloak-admin"` | keycloak admin user |
| keycloak.auth.existingSecret | string | `"keycloak-admin"` | keycloak admin secret |
| keycloak.auth.passwordSecretKey | string | `"secret"` | keycloak admin secret key |
| keycloak.extraEnvVars | list | `[{"name":"KEYCLOAK_USER","value":"keycloak-admin"},{"name":"KEYCLOAK_PASSWORD","valueFrom":{"secretKeyRef":{"key":"secret","name":"keycloak-admin"}}},{"name":"JAVA_OPTS_APPEND","value":"-Djgroups.dns.query=openmfp-keycloak-headless.openmfp-system.svc.cluster.local"}]` | keycloak environment variables (raw) For Arm64 arch (especially Apple M4), add -XX:UseSVE=0 to JAVA_OPTS_APPEND |
| keycloak.httpRelativePath | string | `"/keycloak/"` | keycloak http relative path |
| keycloak.postgresql | object | `{"auth":{"existingSecret":"","secretKeys":{"adminPasswordKey":"password","userPasswordKey":"password"},"username":"keycloak"},"nameOverride":"postgresql-keycloak","primary":{"resourcesPreset":"none"}}` | configuration for the postgresql sub-chart |
| keycloak.postgresql.auth | object | `{"existingSecret":"","secretKeys":{"adminPasswordKey":"password","userPasswordKey":"password"},"username":"keycloak"}` | authorization configuration |
| keycloak.postgresql.auth.existingSecret | string | `""` | existing secret name |
| keycloak.postgresql.auth.secretKeys.adminPasswordKey | string | `"password"` | admin password key |
| keycloak.postgresql.auth.secretKeys.userPasswordKey | string | `"password"` | user password key |
| keycloak.postgresql.auth.username | string | `"keycloak"` | postgresql username |
| keycloak.postgresql.nameOverride | string | `"postgresql-keycloak"` | postgresql name override |
| keycloak.postgresql.primary.resourcesPreset | string | `"none"` | primary postgresql resources preset |
| keycloakConfig.admin | object | `{"password":{"valueFrom":{"secretKeyRef":{"key":"secret","name":"keycloak-admin"}}},"username":{"value":"keycloak-admin"}}` | admin user configuration |
| keycloakConfig.admin.password | object | `{"valueFrom":{"secretKeyRef":{"key":"secret","name":"keycloak-admin"}}}` | admin password |
| keycloakConfig.admin.password.valueFrom.secretKeyRef.key | string | `"secret"` | key of the password in the secret |
| keycloakConfig.admin.password.valueFrom.secretKeyRef.name | string | `"keycloak-admin"` | name of the secret containing the password |
| keycloakConfig.admin.username.value | string | `"keycloak-admin"` | username |
| keycloakConfig.client | object | `{"name":"openmfp","targetSecret":{"name":"portal-client-secret-openmfp","namespace":"openmfp-system"},"tokenLifespan":3600}` | client configuration |
| keycloakConfig.client.name | string | `"openmfp"` | client name |
| keycloakConfig.client.targetSecret | object | `{"name":"portal-client-secret-openmfp","namespace":"openmfp-system"}` | target secret options |
| keycloakConfig.client.targetSecret.name | string | `"portal-client-secret-openmfp"` | secret name |
| keycloakConfig.client.targetSecret.namespace | string | `"openmfp-system"` | secret namespace |
| keycloakConfig.client.tokenLifespan | int | `3600` | token lifespan |
| keycloakConfig.realm | object | `{"name":"master"}` | realm configuration |
| keycloakConfig.realm.name | string | `"master"` | realm name |
| keycloakConfig.redirectUrls | list | `["http://localhost:8000/callback*"]` | redirect urls |
| keycloakConfig.url | string | `"http://openmfp-keycloak.openmfp-system.svc.cluster.local/keycloak"` | url of the keycloak server |
| keycloakConfig.userRegistration.enabled | bool | `true` | toggle to enable/disable user registration |
| service | object | `{"name":"openmfp-keycloak","port":80}` | service configuration |
| service.name | string | `"openmfp-keycloak"` | service name |
| service.port | int | `80` | service port |

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
