variable "admin_username" {
  type        = string
  description = "Local Administrator Username"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH Public Key"
}

variable "sa_key" {
  type        = string
  description = "Key for storage account where the post deployment script resides"
  sensitive   = true
}