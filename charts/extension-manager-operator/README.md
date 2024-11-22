# Extension Manager Operator

The Extension Manager Operator is a Helm chart for deploying and managing the Extension Manager in a Kubernetes cluster.

## Prerequisites

- Kubernetes 1.16+
- Helm 3.0+

## Installation

To install the chart with the release name `my-release`:

```bash
helm install my-release ./charts/extension-manager-operator
```

## Uninstallation

To uninstall/delete the `my-release` deployment:

```bash
helm uninstall my-release
```

## Configuration

The following table lists the configurable parameters of the Extension Manager Operator chart and their default values.

| Parameter                | Description                                | Default                        |
|--------------------------|--------------------------------------------|--------------------------------|
| `image.name`             | Image repository                           | `ghcr.io/openmfp/extension-content-operator` |
| `image.tag`              | Image tag                                  | `0.16.0`                       |
| `imagePullSecret`        | Image pull secret                          | `github`                       |
| `health.port`            | Health probe port                          | `8081`                         |
| `metrics.port`           | Metrics port                               | `8080`                         |
| `deployment.revisionHistoryLimit` | Revision history limit            | `3`                            |
| `deployment.resources.limits.cpu` | CPU limit                         | `260m`                         |
| `deployment.resources.limits.memory` | Memory limit                   | `512Mi`                        |
| `deployment.resources.requests.cpu` | CPU request                     | `150m`                         |
| `deployment.resources.requests.memory` | Memory request               | `128Mi`                        |
| `crds.enabled`           | Enable CRDs                                | `true`                         |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```bash
helm install my-release ./charts/extension-manager-operator --set image.tag=0.17.0
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example:

```bash
helm install my-release ./charts/extension-manager-operator -f values.yaml
```

## License

This project is licensed under the Apache 2.0 License. See the [LICENSE](https://github.com/openmfp/extension-content-operator/blob/main/LICENSE) file for details.