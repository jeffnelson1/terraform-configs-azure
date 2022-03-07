variable "admin_username" {
  type        = string
  description = "Local Administrator Username"
}

variable "admin_password" {
  type        = string
  description = "Local Administrator Password"
}

variable "datadog_apikey" {
  type        = string
  description = "API for the Datadog VM extension"
  sensitive   = true
}
variable "sa_key" {
  type        = string
  description = "Key for storage account where the post deployment script resides"
  sensitive   = true
}

variable "domain_join_userid" {
  type        = string
  description = "AD User ID for joining VM to the specified domain."
}

variable "domain_join_pass" {
  type        = string
  description = "Password for joining VM to the specified domain."
}