
variable "hcloud_token" {
  description = "Hetzner Cloud token (can be obtained from the console)"
}

variable "remote_watermark_image" {
  description = "A remote watermark image. Leave empty if not used."
}

variable "frontend_domain" {
  description = "The domain name used for frontend access. Required for ACME/Let's Encrypt"
}
variable "letsencrypt_mail" {
  description = "E-mail address passed to Let's Encrypt"
}

variable "location" {
  description = "Location of VM and elastic IPs"
  default     = "fsn1"
}

variable "name" {
  description = "Name (prefix) of the infrastructure components"
  default     = "meet"
}

variable "ssh_key_selector" {
  description = "The SSH key selector which will be used for login See https://docs.hetzner.cloud/#overview-label-selector"
  default     = "purpose=admin"
}
