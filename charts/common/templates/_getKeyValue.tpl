{{- define "common.getKeyValue" -}}
  {{- $keyPath := .key -}}
  {{- $values := .Values -}}

  {{- $overrideKey := printf "%sOverride" $keyPath -}}
  {{- $globalKey := printf "global.%s" $keyPath -}}
  {{- $defaultKey := printf "common.defaults.%s" $keyPath -}}

  {{- $value := "" -}}
  {{- if include "common.hasNestedKey" (list $values (splitList "." $overrideKey)) }}
    {{- $value = include "common.getNestedValue" (list $values (splitList "." $overrideKey)) }}
  {{- else if include "common.hasNestedKey" (list $values (splitList "." $globalKey)) }}
    {{- $value = include "common.getNestedValue" (list $values (splitList "." $globalKey)) }}
  {{- else if include "common.hasNestedKey" (list $values (splitList "." $defaultKey)) }}
    {{- $value = include "common.getNestedValue" (list $values (splitList "." $defaultKey)) }}
  {{- else }}
    {{ fail printf "Error: Key '%s' not found as Override, global or common.defaults" $keyPath }}
  {{- end }}
  
  {{- $value -}}
{{- end }}


{{- define "common.hasNestedKey" -}}
{{- /*
This function checks recursively if a nested key exists within a map.
Usage: {{ include "hasNestedKey" (list .Values "key1.key2.key3") }}
Returns: true or false (boolean).
*/ -}}
  {{- $map := index . 0 -}}
  {{- $keyPath := index . 1 -}}

  {{- if gt (len $keyPath) 1 }}
    {{- if hasKey $map (first $keyPath) }}
      {{- include "common.hasNestedKey" (list (get $map (first $keyPath)) (rest $keyPath)) }}
    {{- else }}
      {{- false -}}
    {{- end }}
  {{- else }}
    {{- hasKey $map (first $keyPath) -}}
  {{- end }}

{{- end }}

{{- define "common.getNestedValue" -}}
{{- /*
This function retrieves the value at a nested key within a map.
Usage: {{ include "common.getNestedValue" (list .Values "key1.key2.key3") }}
Returns: The value at the nested key path or nil if the path does not exist.
*/ -}}
  {{- $map := index . 0 -}}
  {{- $keyPath := index . 1 -}}

  {{- if gt (len $keyPath) 1 }}
    {{- if hasKey $map (first $keyPath) }}
      {{- include "common.getNestedValue" (list (get $map (first $keyPath)) (rest $keyPath)) }}
    {{- else }}
      {{- "null" -}}
    {{- end }}
  {{- else }}
    {{- get $map (first $keyPath) -}}
  {{- end }}

{{- end }}


