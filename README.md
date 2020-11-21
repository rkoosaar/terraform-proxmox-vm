# terraform-proxmox-vm

Terraform module for creating and managing VM Qemu resources

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Latest Release](https://img.shields.io/github/v/release/rkoosaar/terraform-proxmox-vm?cacheSeconds=36)](https://github.com/rkoosaar/terraform-proxmox-vm/releases/latest)
[![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/rkoosaar/vm/proxmox)

## Examples

```

module "prx_vm" {
  source = "../../modules/terraform-proxmox-vm"

  vmid        = "7000"
  name        = "test-vm-1"
  target_node = "proxmox_server"

  clone = "centos-x64-template"

  os_type = "cloud-init"

  agent      = 1
  bios       = "ovmf"
  boot       = "cdn"
  bootdisk   = "scsi0"
  cores      = 1
  sockets    = "1"
  cpu        = "host"
  memory     = 1024
  scsihw     = "virtio-scsi-pci"
  onboot     = false
  full_clone = true

  vm_network = [
     {
      model     = "virtio"
      macaddr   = null
      bridge    = "vmbr0"
      tag       = -1
      firewall  = false
      rate      = -1
      queues    = -1
      link_down = false
    }
  ]

  # Cloud init specific
  sshkeys = "ssh-ed25519 AAAAC3NzaC1l7faf6a69UIATUDABIBTrVBGFSDAGLRJ+JjqB0+bgaKW80W6bxv407PzS user@domain.name"
  nameserver = "10.10.10.1"
  searchdomain = "domain.name"
  #ipconfig0 = "ip=10.10.10.15${count.index + 1}/24,gw=10.10.10.1"
}

```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
| --- | --- |
| terraform | >= 0.13 |

## Providers

| Name | Version |
| --- | --- |
| proxmox | >= 2.6.2 |

## Inputs

### generic

| Name | Description | Type | Required |
| --- | --- | --- | --- |
| name | Name of the VM | `string` | yes |
| target_node | Node to place the VM on | `string` | yes |
| vmid | ID of the VM in Proxmox, defaults to next number in the sequence | `string` | yes |
| desc | Description of the VM | `string` | yes |
| bios | Defaults to seabios | `string` | yes |
| onboot | Defaults to true | `bool` | yes |
| boot | Defaults to cdn | `string` | yes |
| bootdisk | Defaults to true | `string` | yes |
| agent | Defaults to 0 | `number` | yes |
| iso | Optional | `string` | no  |
| clone | Optional | `string` | no  |
| full_clone | Optional | `bool` | no  |
| hastate | Optional | `string` | no  |
| qemu_os | Defaults to l26 | `string` | no  |
| memory | Defaults to 512 | `number` | no  |
| balloon | Defaults to 0 | `number` | no  |
| cores | Defaults to 1 | `number` | no  |
| sockets | Defaults to 1 | `number` | no  |
| vcpus | Defaults to 1 | `number` | no  |
| cpu | Defaults to host | `string` | no  |
| numa | Defaults to false | `bool` | no  |
| hotplug | Defaults to network,disk,usb | `string` | no  |
| scsihw | Defaults to the empty string | `string` | no  |
| pool | Optional | `string  <br>` | no  |
| force_create | Defaults to true | `string  <br>` | no  |
| clone_wait | Optional | `string  <br>` | no  |
| preprovision | Defaults to true | `string  <br>` | no  |
| os_type | Which provisioning method to use, based on the OS type. Possible values: ubuntu, centos, cloud-init. | `string  <br>` | no  |

### vga

| Name | Description | Type | Required |
| --- | --- | --- | --- |
| type | Defaults to null | `string` | no  |
| memory | Defaults to null | `number` | no  |

### vm_network

| Name | Description | Type | Required |
| --- | --- | --- | --- |
| model | Defaults to virtio | `string` | no  |
| macaddr | Defaults to null | `string` | no  |
| bridge | Defaults to vmbr0 | `string` | no  |
| tag | Defaults to null | `number` | no  |
| firewall | Defaults to null | `bool` | no  |
| rate | Defaults to null | `number` | no  |
| queues | Defaults to null | `number` | no  |
| link_down | Defaults to null | `bool` | no  |

### vm_disk

| Name | Description | Type | Required |
| --- | --- | --- | --- |
| type | Defaults to null | `string` | no  |
| storage | Defaults to null | `string` | no  |
| size | Defaults to null | `number` | no  |
| format | Defaults to null | `string` | no  |
| cache | Defaults to null | `number` | no  |
| backup | Defaults to null | `bool` | no  |
| ssd | Defaults to null | `bool` | no  |
| discard | Defaults to null | `string` | no  |
| iothread | Defaults to null | `bool` | no  |
| replicate | Defaults to null | `bool` | no  |
| mbps | Defaults to null | `number` | no  |
| mbps_rd | Defaults to null | `number` | no  |
| mbps\_rd\_max | Defaults to null | `number` | no  |
| mbps_wr | Defaults to null | `number` | no  |
| mbps\_wr\_max | Defaults to null | `number` | no  |
| file | Defaults to null | `string` | no  |
| media | Defaults to null | `string` | no  |
| volume | Defaults to null | `string` | no  |
| slog | Defaults to null | `string` | no  |

### serial

| Name | Description | Type | Required |
| --- | --- | --- | --- |
| id  | Defaults to null | `string` | no  |
| type | Defaults to null | `string` | no  |

### cloud init specific

| Name | Description | Type | Required |
| --- | --- | --- | --- |
| nameserver | Defaults to null | `string` | no  |
| searchdomain | Defaults to null | `string` | no  |
| ipconfig0 | Defaults to null | `string` | no  |
| ipconfig1 | Defaults to null | `string` | no  |
| ipconfig2 | Defaults to null | `string` | no  |
| ci_wait | Defaults to null | `string` | no  |
| ciuser | Defaults to null | `string` | no  |
| cipassword | Defaults to null | `string` | no  |
| cicustom | Defaults to null | `string` | no  |
| sshkeys | Defaults to null | `string` | no  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Help

**Got a question?**

File a GitHub [issue](https://github.com/rkoosaar/terraform-proxmox-vm/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/rkoosaar/terraform-proxmox-vm/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2020 Raiko Koosaar

### Contributors

[![Raiko Koosaar][rkoosaar_avatar]][rkoosaar_homepage]<br/>[Raiko Koosaar][rkoosaar_homepage]

[rkoosaar_homepage]: https://github.com/rkoosaar
[rkoosaar_avatar]: https://github.com/rkoosaar.png?size=150
[github]: https://github.com/rkoosaar
[share_email]: mailto:?subject=terraform-proxmox-vm&body=https://github.com/rkoosaar/terraform-proxmox-vm
