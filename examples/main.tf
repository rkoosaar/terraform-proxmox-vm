module "prx_vm" {
  source = "../../modules/terraform-proxmox-vm"

  #count       = "1"
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
      id        = 0
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

  vm_disk = [
    {
      id           = 0
      size         = 40
      type         = "scsi"
      format       = "raw"
      storage      = "pve-data"
      storage_type = null
      backup       = null
      cache        = null
      discard      = null
      iothread     = null
      mbps         = null
      mbps_rd      = null
      mbps_rd_max  = null
      mbps_wr      = null
      mbps_wr_max  = null
      replicate    = null
      ssd          = null
    }
  ]
  # Cloud init specific
  sshkeys      = "ssh-ed25519 AAAAC3NzaC1l7faf6a69UIATUDABIBTrVBGFSDAGLRJ+JjqB0+bgaKW80W6bxv407PzS user@domain.name"
  nameserver   = "10.10.10.1"
  searchdomain = "domain.name"
  #ipconfig0 = "ip=10.10.10.15${count.index + 1}/24,gw=10.10.10.1"

}