output "vpc_id" {
  value       = yandex_vpc_network.develop.id
  description = "ID созданной VPC"
}

output "subnet_id" {
  value       = yandex_vpc_subnet.develop.id
  description = "ID созданной подсети"
}

output "subnet_zone" {
  value       = yandex_vpc_subnet.develop.zone
  description = "Зона подсети"
}