terraform {
  required_version = ">= 1.0.0"
  required_providers {
    proxmox = {
      source = "registry.kvsnet.cf/telmate/proxmox"
      version = ">=2.6.7"
    }
  }
}
