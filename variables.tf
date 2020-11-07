variable "name" {
  description = "Name of the VM"
  type        = string
  default     = null
}

variable "target_node" {
  description = "Node to place the VM on"
  type        = string
  default     = null
}

variable "vmid" {
  description = "ID of the VM in Proxmox, defaults to next number in the sequence"
  type        = string
  default     = null
}

variable "desc" {
  description = "Description of the VM"
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

variable "vga" {
  description = "(optional)"
  type = object({
    type   = string
    memory = number
  })
  default     = null
}

variable "vm_network" {
  description = "(optional)"
  type = list(object({
    id        = number
    model     = string
    macaddr   = string
    bridge    = string
    tag       = number
    firewall  = bool
    rate      = number
    queues    = number
    link_down = bool
  }))
  default     = [
  {
      id        = 0
      model     = "virtio"
      macaddr   = null
      bridge    = "vmbr0"
      tag       = null
      firewall  = null
      rate      = null
      queues    = null
      link_down = null
  }
  ]
}

variable "vm_disk" {
  description = "(optional) describe your variable"
  type = list(object({
    id           = string
    type         = string
    storage      = string
    storage_type = string
    size         = number
    format       = string
    cache        = number
    backup       = bool
    ssd          = bool
    discard      = string
    iothread     = bool
    replicate    = bool
    mbps         = number
    mbps_rd      = number
    mbps_rd_max  = number
    mbps_wr      = number
    mbps_wr_max  = number
  }))
  default     = []
}

variable "serial" {
  description = "(optional)"
  type = object({
    id   = string
    type = string
  })
  default     = null
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
  default     = null
}

