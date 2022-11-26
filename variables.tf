variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "ap-southeast-1"
}

variable "availability_zone" {
  type        = list(string)
  description = "Availability Zone"
  default     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "wp_blueprint_id" {
  type        = string
  description = "WordPress blueprint id"
  default     = "wordpress"
}

variable "bundle_id" {
  type        = string
  description = "Lightsail bundle id"
  default     = "nano_2_0"
}

variable "lightsail_key_pair" {
  type        = string
  description = "Key pair used for ssh access"
  default     = "LightsailDefaultKey-ap-southeast-1.pem"
}
