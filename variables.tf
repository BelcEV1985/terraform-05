

variable "cloud_id" {
  type        = string
  default     = "b1gm8mvrffndc4c8ccli"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g3c3ua7al3753cfmh3"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}


###example vm_web var
variable "vm_name" {
  type        = string
  default     = "netology-vm"
  description = "example vm_name prefix"
}


locals {
  vm_labels = [
    {
      project = "marketing"
    },
    {
      project = "analytics"
    }
  ]
}
