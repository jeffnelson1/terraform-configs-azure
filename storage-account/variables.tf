variable "tags" {
  type = map(any)
  default = {
    Environment = "devtest"
    Owner       = "cloud_team"
  }
}