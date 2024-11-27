{{- define "common.imagePullSecret" }}
imagePullSecrets:
  - name: {{ include "common.certManagerEnabled" (dict "Values" .Values "key" "imagePullSecret") }}
{{- end -}}