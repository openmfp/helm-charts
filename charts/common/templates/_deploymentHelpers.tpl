{{- define "common.deploymentBasics" }}
strategy:
  rollingUpdate:
    maxSurge: {{ include "common.getKeyValue" (dict "Values" .Values "key" "deployment.maxSurge") }}
    maxUnavailable: {{ include "common.getKeyValue" (dict "Values" .Values "key" "deployment.maxUnavailable") }}
  type: {{ include "common.getKeyValue" (dict "Values" .Values "key" "deployment.strategy") }}
revisionHistoryLimit: {{ include "common.getKeyValue" (dict "Values" .Values "key" "deployment.revisionHistoryLimit") }}
selector:
  matchLabels:
    app: {{ .Release.Name }}
{{- end }}
{{- define "common.podBasics" }}
name: {{ .Release.Name }}
image: "{{ .Values.image.name }}:{{ .Values.image.tag }}"
{{ include "common.resources" . }}
{{ include "common.ports" . }}
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
  {{ include "common.PortsMetricsHealth" (dict "Values" .Values) | nindent 2 }}
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

{{- define "common.basicEnvironment" }}
- name: LOG_LEVEL
  value: {{ (.Values.log).level | default "info" }}
- name: REGION
  value: {{ .Values.region }}
- name: ENVIRONMENT
  value: {{ .Values.environment }}
- name: SENTRY_ENVIRONMENT
  value: {{ .Values.sentry.environment | default .Values.environment }}
- name: IMAGE_TAG
  value: "{{ .Values.image.tag }}"
- name: IMAGE_NAME
  value: "{{ .Values.image.name }}"
{{- $technicalIssuers := include "common.technicalIssuers" . }}
{{- if $technicalIssuers }}
- name: TECHNICAL_ISSUERS
  value: {{ $technicalIssuers }}
{{- end }}
{{- include "common.sentry-env" . }}
- name: DIRECTIVES_AUTHORIZATION_ENABLED
  value: "{{ ((.Values.directives).authorization).enabled | default false }}"
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
  value: {{ (and .Values.otel .Values.otel.collectorEndpoint) | default "localhost:4317" }}
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
{{- define "common.PortsMetricsHealth" -}}
- name: metrics
  containerPort: {{ include "common.getKeyValue" (dict "Values" .Values "key" "metrics.port") }}
  protocol: TCP
- name: health-port
  containerPort: {{ include "common.getKeyValue" (dict "Values" .Values "key" "health.port") }}
  protocol: TCP
{{- end -}}


{{- define "common.container.securityContext" -}}
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
