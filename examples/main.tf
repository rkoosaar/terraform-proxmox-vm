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
  iso         = "pve-data:iso/debian-11.0.0-amd64-netinst.iso"
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
  sshkeys      = "ssh-ed25519 AAAAC3NzaC1l7faf6a69UIATUDABIBTrVBGFSDAGLRJ+JjqB0+bgaKW80W6bxv407PzS user@domain.name"
  nameserver   = "10.10.10.1"
  searchdomain = "domain.name"
  #ipconfig0 = "ip=10.10.10.15${count.index + 1}/24,gw=10.10.10.1"


  # vm_disk
  vm_disk = [
    {
      type         = "scsi"
      storage      = "pve-data"
      size         = "40G"
      format       = "qcow2"
    },
    {
      type         = "scsi"
      storage      = "pve-data"
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
