# helm-charts

This repository contains public helm charts for the OpenMFP project.

## Taskfile
It uses Taskfile and task command to local dev tooling. The following tasks are available: `lint, helmtest, test, update, validate, vulnerability, helm-docs`.

## Updating charts
If a chart is changed, it could be dependency of other chart or its dependencies must be updated. To do it, run `task update`.

## Helm-docs
Using https://github.com/norwoodj/helm-docs to generate charts documentation. Documentation can be updated by running `task helm-docs` command.

## Github Actions
Each chart is automatically tested, packaged and published to github repository. Workflows are located in the [.github/workflows](.github/workflows) folder.

## OWASP vulnerability scanning
Kube-linter and kube-score can be run locally with `task vulnerability`. PR changes are also scanned on github and found vulnerability are visible under the Security project section on Github.