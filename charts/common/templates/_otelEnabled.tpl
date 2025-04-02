{{- define "common.otelEnabled" -}}
{{ include "common.getKeyValue" (dict "Values" .Values "key" "otel.enabled") }}
{{- end -}}