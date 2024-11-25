{{- define "common.imagePullSecret" }}
{{- if or .Values.imagePullSecret ((.Values).global).imagePullSecret }}
imagePullSecrets:
  - name: {{ default .Values.imagePullSecret (.Values.global).imagePullSecret }}
{{- end }}
{{- end -}}