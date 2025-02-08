module "vpc_dev" {
  source       = "./vpc"
  vpc_name     = var.vpc_name
  default_zone = var.default_zone
  default_cidr = var.default_cidr
}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")

  vars = {
    ssh_public_key = file("тут могла быть ваша реклама")
  }
}

module "test-vm" {
  source = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=f96532a351d512ef1888e6c12a3d47c65fa10479" # Правка 
  env_name       = var.vm_name
  network_id     = module.vpc_dev.vpc_id
  subnet_zones   = [module.vpc_dev.subnet_zone]
  subnet_ids     = [module.vpc_dev.subnet_id]
  instance_name  = local.vm_labels[0].project
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    project = local.vm_labels[0].project
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered 
    serial-port-enable = 1
  }
}

module "test-vm2" {
  source = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=f96532a351d512ef1888e6c12a3d47c65fa10479" # Правка 
  env_name       = var.vm_name
  network_id     = module.vpc_dev.vpc_id
  subnet_zones   = [module.vpc_dev.subnet_zone]
  subnet_ids     = [module.vpc_dev.subnet_id]
  instance_name  = local.vm_labels[1].project
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true

  labels = { 
    project = local.vm_labels[1].project
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered 
    serial-port-enable = 1
  }
}
