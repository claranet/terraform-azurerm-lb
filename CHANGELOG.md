## 8.0.0 (2024-10-09)

### ⚠ BREAKING CHANGES

* **AZ-1088:** AzureRM Provider v4+ and OpenTofu 1.8+

### Features

* **AZ-1088:** module v8 structure and updates e0ccc03

### Code Refactoring

* apply suggestions 176345d

### Miscellaneous Chores

* **deps:** update dependency opentofu to v1.8.3 6c959b8
* **deps:** update dependency pre-commit to v4 cec7f2d
* **deps:** update dependency pre-commit to v4.0.1 5cd0762
* **deps:** update pre-commit hook pre-commit/pre-commit-hooks to v5 19f0b87
* prepare for new examples structure fe59864
* update examples structure eb1a979

## 7.3.0 (2024-10-03)

### Features

* use Claranet "azurecaf" provider a01d28f

### Documentation

* update README badge to use OpenTofu registry 8a673ef
* update README with `terraform-docs` v0.19.0 283ddbf

### Continuous Integration

* **AZ-1391:** enable semantic-release [skip ci] ed9b3ac
* **AZ-1391:** update semantic-release config [skip ci] 0b9ae7a

### Miscellaneous Chores

* **deps:** add renovate.json e2fbbe6
* **deps:** enable automerge on renovate f108f35
* **deps:** update dependency opentofu to v1.7.0 c638a32
* **deps:** update dependency opentofu to v1.7.1 e5a629b
* **deps:** update dependency opentofu to v1.7.2 4861e4f
* **deps:** update dependency opentofu to v1.7.3 1d5d7d8
* **deps:** update dependency opentofu to v1.8.0 cf7fc3f
* **deps:** update dependency opentofu to v1.8.1 e221253
* **deps:** update dependency opentofu to v1.8.2 ae25b77
* **deps:** update dependency pre-commit to v3.7.1 e807ffd
* **deps:** update dependency pre-commit to v3.8.0 2db813f
* **deps:** update dependency terraform-docs to v0.18.0 c5fdd51
* **deps:** update dependency terraform-docs to v0.19.0 62f3c2b
* **deps:** update dependency tflint to v0.51.0 7be30f1
* **deps:** update dependency tflint to v0.51.1 dff1335
* **deps:** update dependency tflint to v0.51.2 58379a3
* **deps:** update dependency tflint to v0.52.0 b0e37c8
* **deps:** update dependency tflint to v0.53.0 18c7538
* **deps:** update dependency trivy to v0.50.2 a0cda4d
* **deps:** update dependency trivy to v0.50.4 1458d42
* **deps:** update dependency trivy to v0.51.0 edb567c
* **deps:** update dependency trivy to v0.51.1 5673924
* **deps:** update dependency trivy to v0.51.2 8363759
* **deps:** update dependency trivy to v0.51.4 600b1f0
* **deps:** update dependency trivy to v0.52.0 98b0c21
* **deps:** update dependency trivy to v0.52.1 fe6bcd3
* **deps:** update dependency trivy to v0.52.2 10b6a51
* **deps:** update dependency trivy to v0.53.0 678b66a
* **deps:** update dependency trivy to v0.54.1 3306c6c
* **deps:** update dependency trivy to v0.55.0 9d67cde
* **deps:** update dependency trivy to v0.55.1 5008ef7
* **deps:** update dependency trivy to v0.55.2 53e631b
* **deps:** update dependency trivy to v0.56.1 74e2dd8
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.17.0 09db973
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.18.0 874424e
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 e0573b5
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.1 be339fb
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.2 fd4fae6
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.3 8b360cc
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.93.0 8dfd485
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.0 473ff78
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.1 4f3f067
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.2 e22d324
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.3 2aab745
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.95.0 3008152
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.0 f33e0d0
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.1 9d0aa70
* **deps:** update renovate.json c72cee9
* **pre-commit:** update commitlint hook 844bd7a
* **release:** remove legacy `VERSION` file b2f02b0

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
