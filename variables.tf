variable "vm_enable" {
  description = "Enables or Disables VM creation. Defaults to false"
  type        = bool
  default     = false
}

variable "vmid" {
  description = "ID of the VM in Proxmox, defaults to next number in the sequence"
  type        = string
  default     = null
}

variable "name" {
  description = "Name of the VM"
  type        = string
  default     = null
}

variable "define_connection_info" {
  description = "by default define SSH for provisioner info"
  type        = bool
  default     = true
}

variable "desc" {
  description = "Description of the VM"
  type        = string
  default     = null
}

variable "target_node" {
  description = "Node to place the VM on"
  type        = string
  default     = null
}

variable "bios" {
  description = "Defaults to seabios"
  type        = string
  default     = "seabios"
}

variable "onboot" {
  description = "Defaults to true"
  type        = bool
  default     = true
}

variable "boot" {
  description = "Defaults to cdn"
  type        = string
  default     = "cdn"
}

variable "bootdisk" {
  description = "Defaults to true"
  type        = string
  default     = "true"
}

variable "agent" {
  description = "Defaults to 0"
  type        = number
  default     = 1
}

variable "guest_agent_ready_timeout" {
  description = "Defaults to 600"
  type        = number
  default     = 60
}

variable "iso" {
  description = "Optional"
  type        = string
  default     = null
}

variable "clone" {
  description = "Optional"
  type        = string
  default     = null
}

variable "full_clone" {
  description = "Optional"
  type        = bool
  default     = true
}

variable "hastate" {
  description = "Optional"
  type        = string
  default     = null
}

variable "qemu_os" {
  description = "Defaults to l26"
  type        = string
  default     = "l26"
}

variable "memory" {
  description = "Defaults to 512"
  type        = number
  default     = 512
}

variable "balloon" {
  description = "Defaults to 0"
  type        = number
  default     = 0
}

variable "cores" {
  description = "Defaults to 1"
  type        = number
  default     = 1
}

variable "sockets" {
  description = "Defaults to 1"
  type        = number
  default     = 1
}

variable "vcpus" {
  description = "Defaults to 1"
  type        = number
  default     = 1
}

variable "cpu" {
  description = "Defaults to host"
  type        = string
  default     = "host"
}

variable "numa" {
  description = "Defaults to false"
  type        = bool
  default     = false
}

variable "kvm" {
  description = "Defaults to true"
  type        = bool
  default     = true
}

variable "hotplug" {
  description = "Defaults to network,disk,usb"
  type        = string
  default     = "network,disk,usb"
}

variable "scsihw" {
  description = "Defaults to the empty string"
  type        = string
  default     = null
}

variable "vga" {
  description = "(optional)"
  type = object({
    type   = string
    memory = number
  })
  default = null
}
# vm_network variables
variable "vm_network" {
  description = "Used to configure the network devices"
  type        = list(any)
  default     = []
}

variable "vm_network_default_model" {
  description = "Required Network Card Model. The virtio model provides the best performance with very low CPU overhead. If your guest does not support this driver, it is usually best to use e1000. Options: e1000, e1000-82540em, e1000-82544gc, e1000-82545em, i82551, i82557b, i82559er, ne2k_isa, ne2k_pci, pcnet, rtl8139, virtio, vmxnet3"
  type        = string
  default     = "virtio"
}
variable "vm_network_default_macaddr" {
  description = "Override the randomly generated MAC Address for the VM"
  type        = string
  default     = null
}
variable "vm_network_default_bridge" {
  description = "Bridge to which the network device should be attached. The Proxmox VE standard bridge is called vmbr0"
  type        = string
  default     = "vmbr0"
}

variable "vm_network_default_tag" {
  description = "The VLAN tag to apply to packets on this device. -1 disables VLAN tagging"
  type        = number
  default     = -1
}
variable "vm_network_default_firewall" {
  description = "Whether to enable the Proxmox firewall on this network device"
  type        = bool
  default     = false
}
variable "vm_network_default_rate" {
  description = "Network device rate limit in mbps (megabytes per second) as floating point number. Set to 0 to disable rate limiting"
  type        = number
  default     = 0
}
variable "vm_network_default_queues" {
  description = "Number of packet queues to be used on the device. Requires virtio model to have an effect"
  type        = number
  default     = 0
}

variable "vm_network_default_link_down" {
  description = "Whether this interface should be disconnected (like pulling the plug)"
  type        = bool
  default     = false
}

variable "pool" {
  description = "Optional"
  type        = string
  default     = null
}

variable "force_create" {
  description = "Defaults to true"
  type        = string
  default     = false
}

variable "clone_wait" {
  description = "Optional"
  type        = string
  default     = null
}

variable "preprovision" {
  description = "Defaults to true"
  type        = string
  default     = null
}

variable "os_type" {
  description = "Which provisioning method to use, based on the OS type. Possible values: ubuntu, centos, cloud-init."
  type        = string
  default     = null
}

# vm_disk variables

variable "vm_disk" {
  description = "A disk block used to configure the disk devices"
  type        = list(any)
  default     = []
}

variable "vm_disk_default_type" {
  description = "Required. The type of disk device to add. Options: ide, sata, scsi, virtio"
  type        = string
  default     = "scsi"
}
variable "vm_disk_default_storage" {
  description = "Required. The name of the storage pool on which to store the disk"
  type        = string
  default     = "local-lvm"
}

variable "vm_disk_default_size" {
  description = "Required. The size of the created disk, Must include G, M, or K, where they represent Gigabytes, Megabytes, and Kilobytes respectively"
  type        = string
  default     = null
}
variable "vm_disk_default_format" {
  description = "The drive’s backing file’s data format. Default is raw"
  type        = string
  default     = "raw"
}
variable "vm_disk_default_cache" {
  description = "The drive’s cache mode. Options: directsync, none, unsafe, writeback, writethrough"
  type        = string
  default     = null
}
variable "vm_disk_default_backup" {
  description = "Whether the drive should be included when making backups"
  type        = number
  default     = 0
}
variable "vm_disk_default_iothread" {
  description = "Whether to use iothreads for this drive. Only effective with a disk of type virtio, or scsi when the the emulated controller type (scsihw top level block argument) is virtio-scsi-single"
  type        = number
  default     = 0
}
variable "vm_disk_default_replicate" {
  description = "Whether the drive should considered for replication jobs"
  type        = number
  default     = 0
}

variable "vm_disk_default_ssd" {
  description = "Whether to expose this drive as an SSD, rather than a rotational hard disk"
  type        = number
  default     = null
}

variable "vm_disk_default_discard" {
  description = "Controls whether to pass discard/trim requests to the underlying storage. Only effective when the underlying storage supports thin provisioning"
  type        = string
  default     = null
}

variable "vm_disk_default_file" {
  description = "The filename portion of the path to the drive’s backing volume. You shouldn't need to specify this, use the storage parameter instead"
  type        = string
  default     = null
}

variable "vm_disk_default_media" {
  description = "The drive’s media type. Options: cdrom, disk"
  type        = string
  default     = null
}

variable "vm_disk_default_volume" {
  description = "The full path to the drive’s backing volume including the storage pool name. You shouldn't need to specify this, use the storage parameter instead"
  type        = string
  default     = null
}

variable "vm_disk_default_slot" {
  description = "Not Sure what this is used for. Do not use"
  type        = number
  default     = null
}

variable "vm_disk_default_storage_type" {
  description = "The type of pool that storage is backed by. You shouldn't need to specify this, use the storage parameter instead"
  type        = string
  default     = null
}

variable "serial" {
  description = "(optional)"
  type = object({
    id   = string
    type = string
  })
  default = null
}

# Cloud Init Specific

variable "nameserver" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "searchdomain" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "ipconfig0" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "ipconfig1" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "ipconfig2" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "ci_wait" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "ciuser" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "cipassword" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "cicustom" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "sshkeys" {
  description = "sshkeys"
  type        = string
  default     = ""
}

# lifecycle variables - currently not in use
// variable "ignore_changes" {
//   description = "When Enabled creates a new VM before destroying. Defaults to false"
//   type        = list(any)
//   default     = []
// }

// variable "create_before_destroy" {
//   description = "When Enabled creates a new VM before destroying. Defaults to false"
//   type        = bool
//   default     = false
// }

// variable "prevent_destroy" {
//   description = "When Enabled prevents destroying the VM. Defaults to false"
//   type        = bool
//   default     = false
// }

