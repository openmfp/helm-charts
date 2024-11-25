{{- define "common.deploymentBasics" }}
strategy:
  rollingUpdate:
    maxSurge: {{ (and .Values.deployment .Values.deployment.maxSurge) | default 5 }}
    maxUnavailable: {{ (and .Values.deployment .Values.deployment.maxUnavailable) | default 0 }}
  type: {{ .Values.deployment.strategy }}
revisionHistoryLimit: 3
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
    {{- if ((.Values.resources).limits).cpu }}
    cpu: {{ ((.Values.resources).limits).cpu | quote }}
    {{- end }}
    memory: {{ ((.Values.resources).limits).memory | default "512Mi" | quote }}
  requests:
    cpu: {{ ((.Values.resources).requests).cpu | default "40m" }}
    memory: {{ ((.Values.resources).requests).memory | default "50Mi" | quote }}
{{- end }}
{{- define "common.ports" }}
ports:
  - name: http
    containerPort: {{ .Values.port | default 8080 }}
    protocol: TCP
  - name: metrics
    containerPort: {{ .Values.metricsPort | default 2112 }}
    protocol: TCP
  - name: health-port
    containerPort: {{ (.Values.health).port | default 3389 }}
    protocol: TCP
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
    path: {{ ((.Values.health).liveness).path | default "/healthz" }}
    port: {{ (.Values.health).port | default 3389 }}
  failureThreshold: {{ ((.Values.health).liveness).failureThreshold | default 1 }}
  periodSeconds: {{ (.Values.health).periodSeconds | default 10 }}
startupProbe:
  httpGet:
    path: {{ ((.Values.health).startup).path | default "/healthz" }}
    port: {{ (.Values.health).port | default 3389 }}
  failureThreshold: {{ ((.Values.health).startup).failureThreshold | default 30 }}
  periodSeconds: {{ (.Values.health).periodSeconds | default 10 }}
readinessProbe:
  httpGet:
    path: {{ ((.Values.health).readiness).path | default "/readyz" }}
    port: {{ (.Values.health).port | default 3389 }}
  initialDelaySeconds: {{ ((.Values.health).readiness).initialDelaySeconds | default 45 }}
  periodSeconds: {{ (.Values.health).periodSeconds | default 10 }}
{{- end }}
{{- define "common.security" }}
securityContext:
  runAsNonRoot: true
  readOnlyRootFilesystem: true
  seccompProfile:
    type: RuntimeDefault
serviceAccountName: {{ .Release.Name }}
automountServiceAccountToken: {{ not (eq (.Values.security).mountServiceAccountToken false) }}
{{- end }}
{{- define "common.terminationGracePeriodSeconds" -}}
{{ .Values.terminationGracePeriodSeconds | default 10 }}
{{- end }}