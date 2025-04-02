{{- define "common.deploymentBasics" }}
strategy:
  rollingUpdate:
    maxSurge: {{ include "common.getKeyValue" (dict "Values" .Values "key" "deployment.maxSurge") }}
    maxUnavailable: {{ include "common.getKeyValue" (dict "Values" .Values "key" "deployment.maxUnavailable") }}
  type: {{ include "common.getKeyValue" (dict "Values" .Values "key" "deployment.strategy") }}
revisionHistoryLimit: {{ include "common.getKeyValue" (dict "Values" .Values "key" "deployment.revisionHistoryLimit") }}
selector:
  matchLabels:
    {{ include "common.labelMatcher" . }}
{{- end }}
{{- define "common.labelMatcher" }}
app: {{ include "common.entity.name" . }}
{{- end }}

{{- define "common.podBasics" }}
name: {{ include "common.entity.name" . }}
image: {{ include "common.image" . }}
{{- include "common.resources" . }}
{{- include "common.ports" . }}
{{- include "common.imagePullPolicy" . }}
{{- end }}
{{- define "common.resources" }}
resources:
  limits:
    cpu: {{ include "common.getKeyValue" (dict "Values" .Values "key" "deployment.resources.limits.cpu") }}
    memory: {{ include "common.getKeyValue" (dict "Values" .Values "key" "deployment.resources.limits.memory") }}
  requests:
    cpu: {{ include "common.getKeyValue" (dict "Values" .Values "key" "deployment.resources.requests.cpu") }}
    memory: {{ include "common.getKeyValue" (dict "Values" .Values "key" "deployment.resources.requests.memory") }}
{{- end }}
{{- define "common.ports" }}
ports:
- name: http
  containerPort: {{ include "common.getKeyValue" (dict "Values" .Values "key" "port") }}
  protocol: TCP
{{- include "common.PortsMetricsHealth" (dict "Values" .Values) }}
{{- end}}

{{- define "common.technicalIssuers" }}
{{- $technicalIssuers := list }}
{{- range $issuer, $config := .Values.trustedIssuers }}
{{- if $config.isTechnicalIssuer }}
{{- $technicalIssuers = append $technicalIssuers  $config.url}}
{{- end}}
{{- end}}
{{- join "," $technicalIssuers }}
{{- end}}

{{- define "common.commonArgs" }}
args:
{{- include "common.observabilityArgs" . | indent 2 }}
{{- include "common.collectorArgs" . | indent 2 }}
{{- end }}

{{- define "common.collectorArgs" }}
{{- if eq (include "common.otelEnabled" .) "true" }}
- --collector-service-name={{ include "common.entity.name" .}}
- --collector-service-version="{{ include "common.image.tag" . }}"
- --collector-endpoint="{{ include "common.getKeyValue" (dict "Values" .Values "key" "otel.collector.endpoint") }}"
{{- end }}
{{- end }}

{{- define "common.observabilityArgs" }}
- --metrics-bind-address={{ include "common.getKeyValue" (dict "Values" .Values "key" "health.port") }}
- --health-probe-bind-address={{ include "common.getKeyValue" (dict "Values" .Values "key" "health.port") }}
- --log-level={{ include "common.getKeyValue" (dict "Values" .Values "key" "log.level") }}
- --region={{ include "common.getKeyValue" (dict "Values" .Values "key" "region") }}
- --environment={{ include "common.getKeyValue" (dict "Values" .Values "key" "environment") }}
- --image-tag={{ include "common.image.tag" . }}
- --image-name="{{ include "common.image.name" . }}"
{{- end }}

{{- define "common.basicEnvironment" }}
- name: REGION
  value: {{ include "common.getKeyValue" (dict "Values" .Values "key" "region") }}
- name: ENVIRONMENT
  value: {{ include "common.getKeyValue" (dict "Values" .Values "key" "environment") }}
- name: IMAGE_TAG
  value: "{{ include "common.image.tag" . }}"
- name: IMAGE_NAME
  value: "{{ include "common.image.name" . }}"
{{ include "common.sentryEnv" . }}
{{ include "common.extraEnvs" . }}
{{- end }}
{{- define "common.basicService" }}
- name: PORT
  value: "{{ .Values.port }}"
{{- end }}
{{- define "common.basicJob" }}
- name: ISTIO_QUIT_API
  value: http://127.0.0.1:15020
{{- end }}
{{- define "common.collectorEnvironment" }}
- name: COLLECTOR_SERVICE_NAME
  value: {{ .Release.Name }}.{{ .Release.Namespace }}
- name: COLLECTOR_SERVICE_VERSION
  value: {{ .Release.Revision | quote }}
- name: COLLECTOR_ENDPOINT
  value: "{{ (and .Values.otel .Values.otel.collectorEndpoint) | default "localhost:4317" }}"
{{- end }}
{{- define "common.healthEnvironment" }}
- name: HEALTH_PORT
  value: "{{ (.Values.health).port | default 3389 }}"
{{- end }}
{{- define "common.healthAndReadiness" }}
{{ include "common.operatorHealthAndReadyness" . }}
{{- end }}
{{- define "common.operatorHealthAndReadyness" }}
livenessProbe:
  httpGet:
    path: {{ include "common.getKeyValue" (dict "Values" .Values "key" "health.liveness.path") }}
    port: {{ include "common.getKeyValue" (dict "Values" .Values "key" "health.port") }}
  failureThreshold: {{ include "common.getKeyValue" (dict "Values" .Values "key" "health.liveness.failureThreshold") }}
  periodSeconds: {{ include "common.getKeyValue" (dict "Values" .Values "key" "health.periodSeconds") }}
startupProbe:
  httpGet:
    path: {{ include "common.getKeyValue" (dict "Values" .Values "key" "health.startup.path") }}
    port: {{ include "common.getKeyValue" (dict "Values" .Values "key" "health.port") }}
  failureThreshold: {{ include "common.getKeyValue" (dict "Values" .Values "key" "health.startup.failureThreshold") }}
  periodSeconds: {{ include "common.getKeyValue" (dict "Values" .Values "key" "health.periodSeconds") }}
readinessProbe:
  httpGet:
    path: {{ include "common.getKeyValue" (dict "Values" .Values "key" "health.readiness.path") }}
    port: {{ include "common.getKeyValue" (dict "Values" .Values "key" "health.port") }}
  initialDelaySeconds: {{ include "common.getKeyValue" (dict "Values" .Values "key" "health.readiness.initialDelaySeconds") }}
  periodSeconds: {{ include "common.getKeyValue" (dict "Values" .Values "key" "health.periodSeconds") }}
{{- end }}
{{- define "common.terminationGracePeriodSeconds" -}}
{{ .Values.terminationGracePeriodSeconds | default 10 }}
{{- end }}
{{- define "common.imagePullPolicy" -}}
{{ include "common.getKeyValue" (dict "Values" .Values "key" "imagePullPolicy") }}
{{- end }}
{{- define "common.PortsMetricsHealth" }}
- name: metrics
  containerPort: {{ include "common.getKeyValue" (dict "Values" .Values "key" "metrics.port") }}
  protocol: TCP
- name: health-port
  containerPort: {{ include "common.getKeyValue" (dict "Values" .Values "key" "health.port") }}
  protocol: TCP
{{- end -}}


{{- define "common.container.securityContext" }}
securityContext:
  readOnlyRootFilesystem: true
  runAsNonRoot: true
  seccompProfile:
    type: RuntimeDefault
{{- end }}


{{- define "common.pod.securityContext" -}}
securityContext:
  runAsNonRoot: true
  seccompProfile:
    type: RuntimeDefault
serviceAccountName: {{ include "common.entity.name" . }}
automountServiceAccountToken: {{ not (eq (.Values.security).mountServiceAccountToken false) }}
{{- end }}

{{- define "common.spec.securityContext" -}}
securityContext:
  runAsUser: {{ include "common.getKeyValue" (dict "Values" .Values "key" "securityContext.runAsUser") }}
  runAsGroup: {{ include "common.getKeyValue" (dict "Values" .Values "key" "securityContext.runAsGroup") }}
  fsGroup: {{ include "common.getKeyValue" (dict "Values" .Values "key" "securityContext.fsGroup") }}
{{- end }}

{{- define "common.image.tag" -}}
{{- if (.Values.image).tag }}
{{- .Values.image.tag }}
{{- else }}
{{- .Chart.AppVersion }}
{{- end }}
{{- end }}

{{- define "common.image.name" -}}
{{- if (.Values.image).name }}
{{- .Values.image.name }}
{{- else }}
{{- .Chart.Name }}
{{- end }}
{{- end }}

{{- define "common.image" -}}
{{ include "common.image.name" . }}:{{ include "common.image.tag" . }}
{{- end }}
