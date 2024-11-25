{{- define "common.imagePullSecret" }}
{{- if .Values.imagePullSecret }}
imagePullSecrets:
  - name: {{ default .Values.imagePullSecret (.Values.global).imagePullSecret }}
{{- end }}
{{- end -}}