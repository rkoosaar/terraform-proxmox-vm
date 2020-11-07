terraform {
  required_version = ">= 0.13"
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.6.2"
    }
  }
}