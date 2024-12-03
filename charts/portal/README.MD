# portal

![Version: 0.69.127](https://img.shields.io/badge/Version-0.69.127-informational?style=flat-square) ![AppVersion: 0.204.0](https://img.shields.io/badge/AppVersion-0.204.0-informational?style=flat-square)

Helm Chart for the openmfp Portal

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 0.1.5 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| featureToggles | string | `"enableSessionAutoRefresh=true"` |  |
| http.protocol | string | `"https"` |  |
| image.name | string | `"ghcr.io/openmfp/portal"` |  |
| image.pullPolicyOverride | string | `"IfNotPresent"` |  |
| importContent | bool | `true` |  |
| validWebcomponentUrls | string | `".?"` |  |

