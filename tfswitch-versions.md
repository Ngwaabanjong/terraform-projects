# tfswitch Terraform versions 
- Help to switch your terraform version to the required configuration that's on your template.
- Let's say you install Terraform version 1.10.05 and your template is 1.7.0. tfswitch will help you resolve that without updating your template.
- https://github.com/warrensbox/terraform-switcher

  ## Installation
  - Run terraform version to see your OS type.
  - Select the required version per OS on release page: https://github.com/warrensbox/terraform-switcher
 
  ## Configuration
  - Create a folder called tfswitch in C:\Program Files\ and copy the downloaded Binary files.
  - Create a folder call bin in C:\Users\Yourname\ and keep it empty.
  - On you PC search "envirenment variable" and create a new path on PATH and insert: C:\Program Files\tfswitch
 
  ## USE CASE
  - On CLI Run
  - Run tfswitch and use the dropdwon key to select the version you want and press enter.
  ```
  tfswitch
  ```
