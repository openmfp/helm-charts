{{- define "common.istioEnabled" -}}
{{- default (.Values.istio).enabled (((.Values.global).istio).enabled) -}}
{{- end -}}