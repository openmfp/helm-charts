# Extension Manager Operator CRDs

This directory contains the Custom Resource Definitions (CRDs) for the Extension Manager Operator.

## Prerequisites

- Kubernetes 1.16+
- Helm 3.0+

## Installation

To install the CRDs along with the Extension Manager Operator chart:

```bash
helm install my-release ./charts/extension-manager-operator --set crds.enabled=true
```

## Uninstallation

To uninstall/delete the CRDs along with the `my-release` deployment:

```bash
helm uninstall my-release
```

## Configuration

The following table lists the configurable parameters of the Extension Manager Operator CRDs and their default values.

| Parameter                | Description                                | Default |
|--------------------------|--------------------------------------------|---------|
| `crds.enabled`           | Enable CRDs                                | `true`  |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```bash
helm install my-release ./charts/extension-manager-operator --set crds.enabled=false
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example:

```bash
helm install my-release ./charts/extension-manager-operator -f values.yaml
```

## License

This project is licensed under the Apache 2.0 License. See the [LICENSE](https://github.com/openmfp/extension-content-operator/blob/main/LICENSE) file for details.