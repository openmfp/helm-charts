# keycloak

A Helm chart for Kubernetes

![Version: 0.59.21](https://img.shields.io/badge/Version-0.59.21-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

## Additional Information

The `common` chart is a library of common resources that are shared across all other charts in the repository. It has no templates, but provides helm template functions and default values that can be used by other charts.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/openmfp/helm-charts | common | 0.1.5 |
| oci://registry-1.docker.io/bitnamicharts | keycloak(keycloak) | 24.2.2 |

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
| crossplane.clients.openmfp.name | string | `"OpenMFP"` | name of the client |
| crossplane.clients.openmfp.validRedirectUris | list | `["http://localhost:8000/callback*"]` | valid redirect uris for the client |
| crossplane.clients.openmfp.validRedirectUris[0] | string | `"http://localhost:8000/callback*"` | keycloak callback url |
| crossplane.enabled | bool | `false` | toggle to enable/disable crossplane |
| crossplane.identityProviders | object | `{"sap":{"authorizationUrl":"https://login.microsoftonline.com/42f7676c-f455-423c-82f6-dc2d99791af7/oauth2/v2.0/authorize","clientId":"82b4c72c-ff99-4df6-ba4f-fb634d1fc491","clientSecretRef":{"key":"client-secret","name":"sap-client-secret","namespace":"openmfp-system"},"clientSecretRemoteRef":"dxp-core-team/manual-secrets/sap-client-secret","issuer":"https://login.microsoftonline.com/42f7676c-f455-423c-82f6-dc2d99791af7/v2.0","tokenUrl":"https://login.microsoftonline.com/42f7676c-f455-423c-82f6-dc2d99791af7/oauth2/v2.0/token"}}` | crossplane identity providers config |
| crossplane.providerConfig | object | `{"name":"keycloak-provider-config","namespace":"openmfp-system"}` | crossplane provider config |
| crossplane.realm | object | `{"displayName":"OpenMFP","name":"openmfp","registrationAllowed":false}` | crossplane realm config |
| debug | bool | `false` | debug mode |
| domain | object | `{"name":"openmfp.org","pathPrefix":""}` | domain configuration |
| externalSecrets | object | `{"keycloakAdminRemoteRef":"dxp-core-team/manual-secrets/keycloak-admin","postgres-adminRemoteRef":"dxp-core-team/manual-secrets/postgres-admin-password"}` | external secrets configuration |
| istio.virtualservice.hosts | list | `["auth.openmfp.org"]` | istio virtual service hosts |
| job | object | `{"annotations":{"argocd.argoproj.io/hook":"PostSync"},"serviceAccount":"keycloak-client-creation"}` | job configuration |
| keycloak | object | `{"extraEnvVars":"- name: KEYCLOAK_USER\n  value: keycloak-admin\n- name: KEYCLOAK_PASSWORD\n  valueFrom:\n    secretKeyRef:\n      name: keycloak-admin\n      key: secret\n","postgresql":{"auth":{"existingSecret":"","secretKeys":{"adminPasswordKey":"password","userPasswordKey":"password"}}}}` | configuration passed to the child 'keyclaok' chart https://github.com/bitnami/charts/tree/main/bitnami/keycloak |
| keycloakConfig.admin | object | `{"password":{"valueFrom":{"secretKeyRef":{"key":"secret","name":"keycloak-admin"}}},"username":{"value":"keycloak-admin"}}` | admin user configuration |
| keycloakConfig.client | object | `{"name":"openmfp","targetSecret":{"name":"portal-client-secret-openmfp","namespace":"openmfp-system"},"tokenLifespan":3600}` | client configuration |
| keycloakConfig.realm | object | `{"name":"master"}` | realm configuration |
| keycloakConfig.redirectUrls | list | `[]` | redirect urls |
| keycloakConfig.url | string | `"http://keycloak-http.openmfp-system.svc.cluster.local:8080"` | url of the keycloak server |
| keycloakConfig.userRegistration.enabled | bool | `true` | toggle to enable/disable user registration |
| service | object | `{"name":"keycloak"}` | service configuration |

