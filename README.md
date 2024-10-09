# Azure Load Balancer (L4)
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/lb/azurerm/)

This Terraform module creates an [Azure Load Balancer](https://docs.microsoft.com/en-us/azure/load-balancer/load-balancer-overview)
with possible Public IP address and [basic NAT](https://docs.microsoft.com/en-us/azure/load-balancer/load-balancer-outbound-rules-overview).

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | OpenTofu version | AzureRM version |
| -------------- | ----------------- | ---------------- | --------------- |
| >= 8.x.x       | **Unverified**    | 1.8.x            | >= 4.0          |
| >= 7.x.x       | 1.3.x             |                  | >= 3.0          |
| >= 6.x.x       | 1.x               |                  | >= 3.0          |
| >= 5.x.x       | 0.15.x            |                  | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   |                  | >= 2.0          |
| >= 3.x.x       | 0.12.x            |                  | >= 2.0          |
| >= 2.x.x       | 0.12.x            |                  | < 2.0           |
| <  2.x.x       | 0.11.x            |                  | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

⚠️ Since modules version v8.0.0, we do not maintain/check anymore the compatibility with
[Hashicorp Terraform](https://github.com/hashicorp/terraform/). Instead, we recommend to use [OpenTofu](https://github.com/opentofu/opentofu/).

```hcl
module "lb" {
  source  = "claranet/lb/azurerm"
  version = "x.x.x"

  client_name    = var.client_name
  environment    = var.environment
  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  stack          = var.stack

  resource_group_name = module.rg.name

  public_ip_allocated = true
  nat_enabled         = true
}
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.2.28 |
| azurerm | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_outbound_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_outbound_rule) | resource |
| [azurerm_public_ip.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurecaf_name.default_pool](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |
| [azurecaf_name.lb](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |
| [azurecaf_name.pubip](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_name | Client name/account used in naming. | `string` | n/a | yes |
| custom\_name | Name of the Load Balancer, generated if not set. | `string` | `""` | no |
| default\_backend\_pool\_custom\_name | Name of the default Load Balancer backend pool, generated if not set. | `string` | `""` | no |
| default\_tags\_enabled | Option to enable or disable default tags. | `bool` | `true` | no |
| environment | Project environment. | `string` | n/a | yes |
| extra\_tags | Extra tags to add on all resources. | `map(string)` | `{}` | no |
| frontend\_ip\_configurations | `frontend_ip_configuration` blocks as documented (here)[https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#frontend_ip_configuration]. | <pre>map(object({<br/>    subnet_id = string<br/><br/>    zones = optional(list(number))<br/><br/>    private_ip_address            = optional(string)<br/>    private_ip_address_allocation = optional(string, "Dynamic")<br/>    private_ip_address_version    = optional(string, "IPv4")<br/><br/>    public_ip_address_id = optional(string)<br/>    public_ip_prefix_id  = optional(string)<br/><br/>    gateway_load_balancer_frontend_ip_configuration_id = optional(string)<br/>  }))</pre> | `{}` | no |
| ip\_custom\_name | Name of the Public IP address, generated if not set. | `string` | `""` | no |
| ip\_extra\_tags | Extra tags to add to the Public IP address. | `map(string)` | `{}` | no |
| lb\_extra\_tags | Extra tags to add to the Load Balancer. | `map(string)` | `{}` | no |
| location | Azure location. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| name\_prefix | Optional prefix for the generated name. | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name. | `string` | `""` | no |
| nat\_allocated\_outbound\_ports | Number of allocated outbound ports for NAT. | `number` | `1024` | no |
| nat\_enabled | True to enable NAT through Load Balancer outbound rules. | `bool` | `false` | no |
| nat\_protocol | Transport protocol to use for NAT. | `string` | `"All"` | no |
| public\_ip\_allocated | True to allocate a Public IP to the Load Balancer. | `bool` | `false` | no |
| public\_ip\_allocation\_method | Allocation method for the Public IP address, can be `Static`, `Dynamic`. | `string` | `"Static"` | no |
| public\_ip\_custom\_domain\_name\_label | Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system. Defaults to Load Balancer's name, set `null` to disable. | `string` | `""` | no |
| public\_ip\_sku | SKU name for the Public IP address, can be `Basic` or `Standard`. | `string` | `"Standard"` | no |
| resource\_group\_name | Resource group name. | `string` | n/a | yes |
| sku\_name | The Name of the SKU used for this Load Balancer. Possible values are `Basic` and `Standard`. | `string` | `"Standard"` | no |
| stack | Project stack name. | `string` | n/a | yes |
| zones | Specifies a list of Availability Zones in which the Public IP Address for this Load Balancer should be located. Also used as default for `frontend_ip_configuration` zones. | `list(number)` | <pre>[<br/>  1,<br/>  2,<br/>  3<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| backend\_address\_pool | Load Balancer's default backend address pool resource object. |
| backend\_address\_pool\_id | ID of the associated default backend address pool. |
| backend\_address\_pool\_ip\_configurations | IP configurations of the associated default backend address pool. |
| backend\_address\_pool\_load\_balancing\_rules | Load balancing rules of the associated default backend address pool. |
| backend\_address\_pool\_name | Name of the associated default backend address pool. |
| frontend\_ip\_configuration | Load Balancer's frontend IP configuration as described [here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb#frontend_ip_configuration). |
| id | ID of the Load Balancer. |
| name | Name of the Load Balancer. |
| oubound\_rule | Load Balancer's default outbound rule resource object if any. |
| outbound\_rule\_allocated\_outbound\_ports | Number of allocated oubound ports of the default outbound rule if any. |
| outbound\_rule\_id | ID of the default outbound rule if any. |
| outbound\_rule\_name | Name of the default outbound rule if any. |
| private\_ip\_address | Private IP address of the Load Balancer. |
| private\_ip\_addresses | Private IP addresses of the Load Balancer. |
| pubip | Public IP address resource object if any. |
| pubip\_domain\_name\_label | Domain name label of the public IP address if any. |
| pubip\_fqdn | FQDN of the public IP address if any. |
| pubip\_id | ID of the public IP address if any. |
| pubip\_ip\_address | IP address of the public IP address if any. |
| resource | Load Balancer resource object. |
<!-- END_TF_DOCS -->
## Related documentation

Microsoft Azure documentation: [docs.microsoft.com/en-us/azure/load-balancer/](https://docs.microsoft.com/en-us/azure/load-balancer/)
