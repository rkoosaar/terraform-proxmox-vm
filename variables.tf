variable "vm_enable" {
  description = "Enables or Disables VM creation. Defaults to false"
  type        = bool
  default     = false
}

variable "name" {
  description = "Required The name of the VM within Proxmox."
  type        = string
  default     = null
}

variable "target_node" {
  description = "Required The name of the Proxmox Node on which to place the VM."
  type        = string
  default     = null
}

variable "vmid" {
  description = "The ID of the VM in Proxmox. The default value of 0 indicates it should use the next available ID in the sequence"
  type        = number
  default     = 0
}

variable "desc" {
  description = "Description of the VM"
  type        = string
  default     = null
}

variable "define_connection_info" {
  description = "Whether to let terraform define the (SSH) connection parameters for preprovisioners. Defaults to true"
  type        = bool
  default     = true
}

variable "bios" {
  description = "The BIOS to use, options are seabios or ovmf for UEFI. Defaults to seabios"
  type        = string
  default     = "seabios"
}

variable "onboot" {
  description = "	Whether to have the VM startup after the PVE node starts. Defaults to false"
  type        = bool
  default     = false
}

variable "oncreate" {
  description = "Whether to have the VM startup after the VM is created. Defaults to true"
  type        = bool
  default     = true
}

variable "tablet" {
  description = "	Enable/disable the USB tablet device. This device is usually needed to allow absolute mouse positioning with VNC. Defaults to true"
  type        = bool
  default     = true
}

variable "boot" {
  description = "The boot order for the VM.  Options: floppy (a), hard disk (c), CD-ROM (d), or network (n). Defaults to cdn"
  type        = string
  default     = "cdn"
}

variable "bootdisk" {
  description = "Enable booting from specified disk. Defaults to true"
  type        = string
  default     = "true"
}

variable "agent" {
  description = "Defaults to 0"
  type        = number
  default     = 0
}

variable "iso" {
  description = "The name of the ISO image to mount to the VM. Either clone or iso needs to be set"
  type        = string
  default     = null
}

variable "pxe" {
  description = "If set to true, enable PXE boot of the VM. Also requires a boot order be set with Network first"
  type        = bool
  default     = null
}

variable "clone" {
  description = "The base VM from which to clone to create the new VM. Note that clone is mutually exclussive with pxe and iso modes"
  type        = string
  default     = null
}

variable "full_clone" {
  description = "Set to true to create a full clone, or false to create a linked clone. Only applies when clone is set"
  type        = bool
  default     = true
}

variable "hastate" {
  description = "Requested HA state for the resource. One of started, stopped, enabled, disabled, or ignored"
  type        = string
  default     = null
}

variable "hagroup" {
  description = "The HA group identifier the resource belongs to (requires hastate to be set!)"
  type        = string
  default     = null
}

variable "qemu_os" {
  description = "The type of OS in the guest. Set properly to allow Proxmox to enable optimizations for the appropriate guest OS. Defaults to l26"
  type        = string
  default     = "l26"
}

variable "memory" {
  description = "The amount of memory to allocate to the VM in Megabytes. Defaults to 512"
  type        = number
  default     = 512
}

variable "balloon" {
  description = "The minimum amount of memory to allocate to the VM in Megabytes, when Automatic Memory Allocation is desired. Defaults to 0"
  type        = number
  default     = 0
}

variable "sockets" {
  description = "The number of CPU sockets to allocate to the VM. Defaults to 1"
  type        = number
  default     = 1
}

variable "cores" {
  description = "The number of CPU cores per CPU socket to allocate to the VM. Defaults to 1"
  type        = number
  default     = 1
}

variable "vcpus" {
  description = "The number of vCPUs plugged into the VM when it starts. If 0, this is set automatically by Proxmox to sockets * cores. Defaults to 0"
  type        = number
  default     = 0
}

variable "cpu" {
  description = "The type of CPU to emulate in the Guest. Defaults to host"
  type        = string
  default     = "host"
}

variable "numa" {
  description = "Whether to enable Non-Uniform Memory Access in the guest. Defaults to false"
  type        = bool
  default     = false
}

variable "kvm" {
  description = "Defaults to true"
  type        = bool
  default     = true
}

variable "hotplug" {
  description = "Comma delimited list of hotplug features to enable. Options: network, disk, cpu, memory, usb. Set to 0 to disable hotplug. Defaults to network,disk,usb"
  type        = string
  default     = "network,disk,usb"
}

variable "scsihw" {
  description = "The SCSI controller to emulate. Options: lsi, lsi53c810, megasas, pvscsi, virtio-scsi-pci, virtio-scsi-single. Defaults to lsi"
  type        = string
  default     = "lsi"
}


variable "pool" {
  description = "The resource pool to which the VM will be added. Optional"
  type        = string
  default     = null
}

variable "tags" {
  description = "	Tags of the VM. This is only meta information. Optional"
  type        = string
  default     = null
}

variable "force_create" {
  description = "If false, and a vm of the same name, on the same node exists, terraform will attempt to reconfigure that VM with these settings. Set to true to always create a new VM. Defaults to true"
  type        = string
  default     = false
}

variable "os_type" {
  description = "Which provisioning method to use, based on the OS type. Possible values: ubuntu, centos, cloud-init."
  type        = string
  default     = null
}

# An example where this is useful is a cloudinit configuration (as the cicustom attribute points to a file not the content).
variable "force_recreate_on_change_of" {
  description = "If the value of this string changes, the VM will be recreated. Useful for allowing this resource to be recreated when arbitrary attributes change"
  type        = string
  default     = null
}

# os_network_config
variable "os_network_config" {
  description = "Only applies when define_connection_info is true."
  type        = string
  default     = null
}

variable "ssh_forward_ip" {
  description = "Only applies when define_connection_info is true. The IP (and optional colon separated port), to use to connect to the host for preprovisioning. If using cloud-init, this can be left blank"
  type        = string
  default     = null
}

variable "ssh_user" {
  description = "Only applies when define_connection_info is true. The user with which to connect to the guest for preprovisioning. Forces re-creation on change"
  type        = string
  default     = null
}

variable "ssh_private_key" {
  description = "Only applies when define_connection_info is true. The private key to use when connecting to the guest for preprovisioning. Sensitive"
  type        = string
  default     = null
}

# Cloud Init Specific

variable "ci_wait" {
  description = "How to long in seconds to wait for before provisioning. Defaults to 30"
  type        = number
  default     = 30
}

variable "ciuser" {
  description = "Override the default cloud-init user for provisioning"
  type        = string
  default     = null
}

variable "cipassword" {
  description = "Override the default cloud-init user's password. Sensitive"
  type        = string
  default     = null
}

variable "cicustom" {
  description = "Instead specifying ciuser, cipasword, etc... you can specify the path to a custom cloud-init config file here. Grants more flexibility in configuring cloud-init"
  type        = string
  default     = null
}

variable "searchdomain" {
  description = "Sets default DNS search domain suffix."
  type        = string
  default     = null
}

variable "nameserver" {
  description = "Sets default DNS server for guest"
  type        = string
  default     = null
}

variable "sshkeys" {
  description = "Newline delimited list of SSH public keys to add to authorized keys file for the cloud-init user"
  type        = string
  default     = ""
}

variable "ipconfig0" {
  description = "The first IP address to assign to the guest. Format: [gw=<GatewayIPv4>] [,gw6=<GatewayIPv6>] [,ip=<IPv4Format/CIDR>] [,ip6=<IPv6Format/CIDR>]"
  type        = string
  default     = null
}

variable "ipconfig1" {
  description = "The second IP address to assign to the guest. Same format as ipconfig0"
  type        = string
  default     = null
}

variable "ipconfig2" {
  description = "The third IP address to assign to the guest. Same format as ipconfig0"
  type        = string
  default     = null
}

variable "ipconfig3" {
  description = "The third IP address to assign to the guest. Same format as ipconfig0"
  type        = string
  default     = null
}

variable "ipconfig4" {
  description = "The third IP address to assign to the guest. Same format as ipconfig0"
  type        = string
  default     = null
}

variable "automatic_reboot" {
  description = "Automatically reboot the VM when parameter changes require this. If disabled the provider will emit a warning when the VM needs to be rebooted."
  type        = bool
  default     = true
}


variable "vga" {
  description = "The vga block is used to configure the display device."
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

variable "vm_disk_default_mbps" {
  description = "Maximum r/w speed in megabytes per second. 0 means unlimited."
  type        = number
  default     = null
}

variable "vm_disk_default_mbps_rd" {
  description = "Maximum read speed in megabytes per second. 0 means unlimited."
  type        = number
  default     = null
}

variable "vm_disk_default_mbps_rd_max" {
  description = "Maximum read speed in megabytes per second. 0 means unlimited."
  type        = number
  default     = null
}

variable "vm_disk_default_mbps_wr" {
  description = "Maximum write speed in megabytes per second. 0 means unlimited."
  type        = number
  default     = null
}

variable "vm_disk_default_mbps_wr_max" {
  description = "Maximum throttled write pool in megabytes per second. 0 means unlimited."
  type        = number
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

variable "vm_disk_default_storage_type" {
  description = "The type of pool that storage is backed by. You shouldn't need to specify this, use the storage parameter instead"
  type        = string
  default     = null
}

variable "serial" {
  description = "Create a serial device inside the VM (up to a maximum of 4 can be specified)"
  type = object({
    id   = string
    type = string
  })
  default = null
}

variable "usb" {
  description = "The usb block is used to configure USB devices."
  type = object({
    host   = string
    usb3 = bool
  })
  default = null
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

