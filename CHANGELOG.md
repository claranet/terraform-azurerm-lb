# v7.2.0 - 2023-01-16

Added
  * AZ-978: Add Public IP domain name label option

# v7.1.0 - 2022-11-23

Changed
  * AZ-908: Use the new data source for CAF naming (instead of resource)

# v7.0.1 - 2022-10-28

Fixed
  * AZ-883: Fix old HCL deprecated code, cleanup for latest `terraform-linters` rules

# v7.0.0 - 2022-10-21

Breaking
  * AZ-840: Require Terraform 1.3+

Changed
  * AZ-874: Refactor variables types

# v6.0.1 - 2022-06-17

Fixed
  * AZ-777: Add a new `zones` parameter to manage availability zones for both Public IP and LB frontend IP

# v6.0.0 - 2022-05-13

Breaking
   * AZ-717: Update module for AzureRM provider `v3.0`

# v5.0.0 - 2022-03-18

Breaking
  * AZ-515: Option to use Azure CAF naming provider to name resources
  * AZ-515: Require Terraform 0.13+

Added
  * AZ-615: Add an option to enable or disable default tags

# v4.1.0 - 2021-11-23

Changed
  * AZ-572: Revamp examples and improve CI

Added
  * AZ-591: Export `frontend_ip_configuration` attribute as an output

# v3.1.1/v4.0.1 - 2021-08-27

Changed
  * AZ-532: Revamp README with latest `terraform-docs` tool

# v3.1.0/v4.0.0 - 2021-01-21

Updated
  * AZ-273: Module now compatible terraform `v0.13+` and `v0.14+`

# v2.0.1/v3.0.1 - 2020-08-24

Fixed
  * AZ-258: Fix each.value Error on `lb_frontend_ip_configurations`

# v2.0.0 - 2020-07-30

Added
  * AZ-51: Azure Load Balancer - First version
