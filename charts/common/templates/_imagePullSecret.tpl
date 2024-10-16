{{- define "global.imagePullSecret" }}
imagePullSecrets:
  - name: {{ default .Values.imagePullSecret (.Values.global).imagePullSecret }}
{{- end -}}