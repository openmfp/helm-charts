{{/* 
  Function: common.getKeyValue
  Description: 
    Retrieves a value from the Helm chart's values.yaml file based on a prioritized key lookup.
    The function searches for a value in the following order:
      1. An override key (`keyPathOverride`).
      2. A global key (`global.keyPath`).
      3. A default key (`defaults.keyPath`).
    If none of these keys exist, it returns an empty string.

  Parameters:
    - .key: The path to the key being retrieved.
    - .Values: The values object passed to the Helm template.

  Dependencies:
    - Uses helper functions "common.hasNestedKey" and "common.getNestedValue" to check 
      the existence of nested keys and retrieve their values.

  Usage:
    This function is intended to prioritize overrides and global configurations 
    in a Helm chart's values.yaml file while providing default fallback values.

*/}}

{{- define "common.getKeyValue" -}}
  {{- $keyPath := .key -}}
  {{- $values := .Values -}}

  {{- $overrideKey := printf "%sOverride" $keyPath -}}
  {{- $globalKey := printf "global.%s" $keyPath -}}
  {{- $defaultKey := printf "defaults.%s" $keyPath -}}

  {{- $value := "" -}}
  {{- if eq (include "common.hasNestedKey" (dict "Values" $values "key" $overrideKey)) "true" }}
    {{- $value = include "common.getNestedValue" (dict "Values" $values "key" $overrideKey) }}
  {{- else if eq (include "common.hasNestedKey" (dict "Values" $values "key" $globalKey)) "true" }}
    {{- $value = include "common.getNestedValue" (dict "Values" $values "key" $globalKey) }}
  {{- else if eq (include "common.hasNestedKey" (dict "Values" $values "key" $defaultKey)) "true" }}
    {{- $value = include "common.getNestedValue" (dict "Values" $values "key" $defaultKey) }}
  {{- else }}
    {{- $value = "" -}}
  {{- end }}

  {{- $value -}}
{{- end }}


{{- define "common.hasNestedKey" -}}
{{- /*
This function checks recursively if a nested key exists within a map.
Usage: {{ include "common.hasNestedKey" (dict "Values" .Values "key" "key1.key2.key3") }}
Returns: true or false (boolean).
*/ -}}
  {{- $map := .Values -}}
  {{- $keyPath := splitList "." .key -}}
  {{- $output := false -}}

  {{- if not (kindIs "map" $map) }}
    {{- $output = false -}}
  {{- else if eq (len $keyPath) 1 }}
    {{- $output = hasKey $map (first $keyPath) -}}
  {{- else }}
    {{- $currentKey := first $keyPath -}}
    {{- $remainingKeys := rest $keyPath | join "." -}}
    {{- $nextMap := get $map $currentKey -}}
    {{- if kindIs "map" $nextMap }}
      {{- $output = include "common.hasNestedKey" (dict "Values" $nextMap "key" $remainingKeys) -}}
    {{- else }}
      {{- $output = false -}}
    {{- end }}
  {{- end }}
  {{- $output -}}
{{- end }}



{{- define "common.getNestedValue" -}}
{{- /*
This function retrieves the value at a nested key within a map.
Usage: {{ include "common.getNestedValue" (dict "Values" .Values "key" "key1.key2.key3") }}
Returns: The value at the nested key path or "null" if the path does not exist.
*/ -}}
  {{- $map := .Values -}}
  {{- $keyPath := splitList "." .key -}}

  {{- if not (kindIs "map" $map) }}
    {{- fail "common.getNestedValue: Values must be a map" -}}
  {{- else if eq (len $keyPath) 1 }}
    {{- if hasKey $map (first $keyPath) }}
      {{- get $map (first $keyPath) -}}
    {{- else }}
      {{- "null" -}}
    {{- end }}
  {{- else }}
    {{- $currentKey := first $keyPath -}}
    {{- $remainingKeys := rest $keyPath | join "." -}}
    {{- if hasKey $map $currentKey }}
      {{- include "common.getNestedValue" (dict "Values" (get $map $currentKey) "key" $remainingKeys) -}}
    {{- else }}
      {{- "null" -}}
    {{- end }}
  {{- end }}
{{- end }}


