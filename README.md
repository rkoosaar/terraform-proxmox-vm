# terraform-proxmox-vm

Terraform module for creating and managing VM Qemu resources

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Latest Release](https://img.shields.io/github/v/release/rkoosaar/terraform-proxmox-vm?cacheSeconds=36)](https://github.com/rkoosaar/terraform-proxmox-vm/releases/latest)
[![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/rkoosaar/vm/proxmox)

## Examples

Below is a small example. look in to example folder for more.

```

module "prx_vm" {
  source = "../../modules/terraform-proxmox-vm"

  # On or Off
  vm_enable = true

  name        = "test-vm-1"
  target_node = "proxmox_server"
  vmid        = "7000"
  desc        = "TEST Server"

  define_connection_info = "true"
  bios       = "seabios"
  onboot     = false
  oncreate   = false
  tablet = true
  boot       = "cdn"
  bootdisk  = "scsi0"
  agent      = 1
  iso         = "iso-store:iso/debian-11.0.0-amd64-netinst.iso"
  #pxe         = false
  #clone       = "centos-x64-template"
  full_clone = false
  memory     = 768
  sockets    = "1"
  cores      = 2
  vcpus      = 2
  cpu        = "host"
  scsihw     = "virtio-scsi-pci"
  force_create = false
  #os_type = "ubuntu"
  automatic_reboot          = true  
  
  # Cloud init specific
  #sshkeys      = "ssh-ed25519 AAAAC3NzaC1l7faf6a69UIATUDABIBTrVBGFSDAGLRJ+JjqB0+bgaKW80W6bxv407PzS user@domain.name"
  #nameserver   = "10.10.10.1"
  #searchdomain = "domain.name"
  #ipconfig0 = "ip=10.10.10.15${count.index + 1}/24,gw=10.10.10.1"

  # vm_disk
  vm_disk = [
    {
      type         = "scsi"
      storage      = "vDisks"
      size         = "40G"
      format       = "qcow2"
    },
    {
      type         = "scsi"
      storage      = "vDisks"
      size         = "20G"
      format       = "qcow2"
    }
  ]

  # vm_network
  vm_network = [
     {
      id        = 0
      model     = "virtio"
      bridge    = "vmbr1"
    },
     {
      id        = 1
      model     = "virtio"
      bridge    = "vmbr0"
    },
  ]
}

```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
| --- | --- |
| terraform | >= 1.0.0 |

## Providers

| Name | Version |
| --- | --- |
| proxmox | >= 2.9.9 |

## Inputs

### generic

| Name | Description | Type | Required |
| --- | --- | --- | --- |
| name | Name of the VM | `string` | yes |
| target_node | Node to place the VM on | `string` | yes |
| vmid | ID of the VM in Proxmox, defaults to next number in the sequence | `string` | yes |
| desc | Description of the VM | `string` | yes |
| define_connection_info | Whether to let terraform define the (SSH) connection parameters | `bool` | true |
define_connection_info
| bios | Defaults to seabios | `string` | yes |
| onboot | Defaults to false | `bool` | yes |
| oncreate | Defaults to true | `bool` | yes |
| tablet | Defaults to true | `bool` | yes |
| boot | Defaults to cdn | `string` | yes |
| bootdisk | Defaults to true | `string` | yes |
| agent | Defaults to 0 | `number` | yes |
| iso | Note that iso is mutually exclussive with pxe and clone modes | `string` | no  |
| pxe | Note that pxe is mutually exclussive with iso and clone modes | `bool` | no  |
| clone | Note that clone is mutually exclussive with pxe and iso modes | `string` | no  |
| full_clone | Optional | `bool` | no  |
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
| file | Defaults to null | `string` | no  |
| media | Defaults to null | `string` | no  |
| volume | Defaults to null | `string` | no  |

### serial

| Name | Description | Type | Required |
| --- | --- | --- | --- |
| id  | Defaults to null | `string` | no  |
| type | Defaults to null | `string` | no  |

### usb

| Name | Description | Type | Required |
| --- | --- | --- | --- |
| host  | Defaults to null | `string` | no  |
| usb3 | Defaults to false | `bool` | no  |


### cloud init specific

| Name | Description | Type | Required |
| --- | --- | --- | --- |
| nameserver | Defaults to null | `string` | no  |
| searchdomain | Defaults to null | `string` | no  |
| ipconfig0 | Defaults to null | `string` | no  |
| ipconfig1 | Defaults to null | `string` | no  |
| ipconfig2 | Defaults to null | `string` | no  |
| ipconfig3 | Defaults to null | `string` | no  |
| ipconfig4 | Defaults to null | `string` | no  |
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

Copyright © 2022 Raiko Koosaar

### Contributors

[![Raiko Koosaar][rkoosaar_avatar]][rkoosaar_homepage]<br/>[Raiko Koosaar][rkoosaar_homepage]

[rkoosaar_homepage]: https://github.com/rkoosaar
[rkoosaar_avatar]: https://github.com/rkoosaar.png?size=150
[github]: https://github.com/rkoosaar
[share_email]: mailto:?subject=terraform-proxmox-vm&body=https://github.com/rkoosaar/terraform-proxmox-vm
