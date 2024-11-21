{{- define "common.certManagerEnabled" -}}
{{- default (.Values.certManager).enabled (((.Values.global).certManager).enabled) -}}
{{- end -}}