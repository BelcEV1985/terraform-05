terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"
}

provider "yandex" {
#  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
  service_account_key_file = file("/media/storage/05_Project/Terraform/authorized_key.json")
}

# отправка state
    backend "s3" {
    endpoints = { s3 = "https://storage.yandexcloud.net"    }
    bucket = "terra-bro"
    region = "ru-central1"
    key    = "terraform.tfstate"

    # access_key                  = ""          #Только для примера! Не хардкодим секретные данные!
    # secret_key                  = ""          #Только для примера! Не хардкодим секретные данные!

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # необходимая опция при описании бэкенда для Terraform версии 1.6.1 и старше.
    skip_s3_checksum            = true # необходимая опция при описании бэкенда для Terraform версии 1.6.3 и старше.

    dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/hn0b6tk45jj76/cdhhhv5fsu3ln6"
    dynamodb_table              = "tfstate-lock"

  }