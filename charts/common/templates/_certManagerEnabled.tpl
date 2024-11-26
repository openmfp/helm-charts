{{- define "common.certManagerEnabled" -}}
{{- include "common.getKeyValue" (dict "Values" .Values "key" .key) }}
{{- end }}
