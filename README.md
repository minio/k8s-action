# k8s-action
GitHub action for k8s clusters by `kubectl` commands.

## Inputs

### `kubectl_args`

**Required** the command to execute.

## Config

**KUBECONFIG_DATA** contents of `~/.kube/config` file as part for [organization or project secrets](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets)

## Outputs

### `kubectl_result`

Result output of the executed `kubectl` command.

## Example Usage

```yml
name: Deploy MinIO

on:
  - push

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Trigger MinIO deployment
        uses: minio/k8s-action@master
        env:
          KUBECONFIG_DATA: ${{ secrets.KUBECONFIG_DATA }}
        with:
          kubectl_args: apply -f statefulset.yaml
```
