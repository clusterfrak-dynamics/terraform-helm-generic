# terraform-helm-release

[![Build Status](https://github.com/clusterfrak-dynamics/terraform-helm-release/workflows/Terraform/badge.svg)](https://github.com/clusterfrak-dynamics/terraform-helm-release/actions?query=workflow%3ATerraform)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/terraform-helm-release)

A terraform module to deploy any Helm release.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| helm | ~> 1.0 |
| kubernetes | ~> 1.0 |

## Providers

| Name | Version |
|------|---------|
| helm | ~> 1.0 |
| kubernetes | ~> 1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| helm\_defaults | Customize default Helm behavior | `any` | `{}` | no |
| release | Helm release | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| metadata | n/a |

