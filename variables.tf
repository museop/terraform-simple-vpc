variable "region" {
  description = "AWS Region"
  type = string
  default = "ap-northeast-2"
}

variable "key_name" {
  description = "Instance Key Pair Name"
  type = string
  default = "ms-test-key"
}