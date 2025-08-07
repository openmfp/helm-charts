# OpenMFP - helm-charts

[![REUSE status](
https://api.reuse.software/badge/github.com/openmfp/helm-charts)](https://api.reuse.software/info/github.com/openmfp/helm-charts)

This repository contains public helm charts for the OpenMFP project.

## Github Actions
Each chart is automatically tested, packaged and published to github repository. Workflows are located in the [.github/workflows](.github/workflows) folder.

## Releasing

The release is performed automatically through a GitHub Actions Workflow.

All the released versions will be available through access to GitHub Packages.

## Requirements

In order to contribute to this repository, you need to have the following tools:
- Helm version 3 installed, follow instructions [here](https://helm.sh/docs/intro/install/).
- Helm unittests is used for running helm tests. To install the helm-unittest helm plugin follow instructions [here](https://github.com/helm-unittest/helm-unittest?tab=readme-ov-file#install)
- This repository uses a taskfile, in order to run tasks install the binary, follow instructions [here](https://taskfile.dev/installation/). 


## Helm
The roles chart uses unit tests. To be able to execute them locally and update the snapshots you need to install a plugin.

```shell
helm plugin install https://github.com/helm-unittest/helm-unittest.git --version v0.5.1
```

Then you can run

```shell
helm unittest ./charts/<chart-name>
```

```shell
# To also update helm snapshot after changes, do:
helm unittest -u ./charts/<chart-name>
```

To test your  changes in the respective chart

## Security / Disclosure
If you find any bug that may be a security problem, please follow our instructions at [in our security policy](https://github.com/openmfp/helm-charts/security/policy) on how to report it. Please do not create GitHub issues for security-related doubts or problems.

## Contributing

Please refer to the [CONTRIBUTING.md](CONTRIBUTING.md) file in this repository for instructions on how to contribute to OpenMFP.

## Code of Conduct

Please refer to the [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) file in this repository information on the expected Code of Conduct for contributing to OpenMFP.

## Licensing

Copyright 2025 SAP SE or an SAP affiliate company and OpenMFP contributors. Please see our [LICENSE](LICENSE) for copyright and license information. Detailed information including third-party components and their licensing/copyright information is available [via the REUSE tool](https://api.reuse.software/info/github.com/openmfp/helm-charts).

