# keycloak

A Helm chart for Kubernetes

![Version: 0.59.21](https://img.shields.io/badge/Version-0.59.21-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

## Configuration

The chart supports the following configuration parameters in the table below. Additionally, default configuration parameters documented in [common/README.md](../common/README.md) are not explicitely listed in the table but are also supported.

## Values

Default configuration parameters, which can be overriden either globally or on a chart level are documented in [common/README.md](../common/README.md).

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| crossplane.clients | object | `{"openmfp":{"name":"OpenMFP","validRedirectUris":["http://localhost:8000/callback*"]}}` | crossplane clients config |
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

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 0.1.5 |
| oci://registry-1.docker.io/bitnamicharts | keycloak(keycloak) | 24.2.2 |

# keycloak

![Version: 0.59.21](https://img.shields.io/badge/Version-0.59.21-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 0.1.5 |
| oci://registry-1.docker.io/bitnamicharts | keycloak(keycloak) | 24.2.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| crossplane.clients | object | `{"openmfp":{"name":"OpenMFP","validRedirectUris":["http://localhost:8000/callback*"]}}` | crossplane clients config |
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

