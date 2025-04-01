{{- define "common.sentryEnabled" -}}
{{ include "common.getKeyValue" (dict "Values" .Values "key" "sentry.enabled") }}
{{- end -}}

{{- define "common.sentry-secret" -}}
{{- if and (eq (include "common.sentryEnabled" .) "true") (eq (include "common.externalSecretsEnabled" .) "true") -}}
apiVersion: external-secrets.io/v1beta1
kind: ExternalSecret
metadata:
  name: {{ .Release.Name }}-sentry
  namespace: {{ .Release.Namespace }}
spec:
  data:
  - remoteRef:
      conversionStrategy: Default
      key: {{ include "common.getKeyValue" (dict "Values" .Values "key" "sentry.externalSecrets.secretKey") }}
      property: {{ default (printf "%s-sentry" .Release.Name) (.Values.sentry).secretProperty }}
    secretKey: dsn
  refreshInterval: 10m
  secretStoreRef:
    kind: {{ include "common.getKeyValue" (dict "Values" .Values "key" "externalSecrets.secretStore.kind") }}
    name: {{ include "common.getKeyValue" (dict "Values" .Values "key" "externalSecrets.secretStore.name") }}
  target:
    creationPolicy: Owner
    deletionPolicy: Retain
    name: {{ .Release.Name }}-sentry
{{- end }}    
{{- end }}

{{- define "common.sentry-env" }}
{{- if eq (include "common.sentryEnabled" .) "true" -}}
- name: SENTRY_DSN
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-sentry
      key: dsn
{{- end }}
{{- end }}
