resource "proxmox_vm_qemu" "vm_qemu" {
  count = var.vm_enable ? 1 : 0

  vmid = var.vmid
  name = var.name
  #def_con_info = var.define_connection_info
  desc        = var.desc
  target_node = var.target_node

  bios     = var.bios
  onboot   = var.onboot
  boot     = var.boot
  bootdisk = var.bootdisk

  agent = var.agent
  #guest_agent_ready_timeout = var.guest_agent_ready_timeout
  iso = var.iso

  clone      = var.clone
  full_clone = var.full_clone

  hastate = var.hastate
  qemu_os = var.qemu_os

  memory  = var.memory
  balloon = var.balloon
  cores   = var.cores
  sockets = var.sockets
  vcpus   = var.vcpus
  cpu     = var.cpu

  numa    = var.numa
  kvm     = var.kvm
  hotplug = var.hotplug
  scsihw  = var.scsihw

  dynamic "vga" {
    for_each = var.vga == null ? [] : list(var.vga)
    content {
      type   = vga.value.type
      memory = vga.value.memory
    }
  }

  dynamic "network" {
    for_each = local.vm_network
    content {
      model     = lookup(network.value, "model", local.vm_network_default_model)
      macaddr   = lookup(network.value, "macaddr", local.vm_network_default_macaddr)
      bridge    = lookup(network.value, "bridge", local.vm_network_default_bridge)
      tag       = lookup(network.value, "tag", local.vm_network_default_tag)
      firewall  = lookup(network.value, "firewall", local.vm_network_default_firewall)
      rate      = lookup(network.value, "rate", local.vm_network_default_rate)
      queues    = lookup(network.value, "queues", local.vm_network_default_queues)
      link_down = lookup(network.value, "link_down", local.vm_network_default_link_down)
    }
  }

  pool         = var.pool
  force_create = var.force_create
  clone_wait   = var.clone_wait
  preprovision = var.preprovision

  os_type = var.os_type

  dynamic "disk" {
    for_each = local.vm_disk
    content {
      type         = lookup(disk.value, "type", local.vm_disk_default_type)
      storage      = lookup(disk.value, "storage", local.vm_disk_default_storage)
      size         = lookup(disk.value, "size", local.vm_disk_default_size)
      format       = lookup(disk.value, "format", local.vm_disk_default_format)
      cache        = lookup(disk.value, "cache", local.vm_disk_default_cache)
      backup       = lookup(disk.value, "backup", local.vm_disk_default_backup)
      iothread     = lookup(disk.value, "iothread", local.vm_disk_default_iothread)
      replicate    = lookup(disk.value, "replicate", local.vm_disk_default_replicate)
      ssd          = lookup(disk.value, "ssd", local.vm_disk_default_ssd)
      discard      = lookup(disk.value, "discard", local.vm_disk_default_discard)
      file         = lookup(disk.value, "file", local.vm_disk_default_file)
      media        = lookup(disk.value, "media", local.vm_disk_default_media)
      volume       = lookup(disk.value, "volume", local.vm_disk_default_volume)
      slot         = lookup(disk.value, "slot", local.vm_disk_default_slot)
      storage_type = lookup(disk.value, "storage_type", local.vm_disk_default_storage_type)
    }
  }

  dynamic "serial" {
    for_each = var.serial == null ? [] : list(var.serial)
    content {
      id   = serial.value.id
      type = serial.value.type
    }
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  # for Cloud-init Settings.
  ci_wait      = var.ci_wait
  ciuser       = var.ciuser
  cipassword   = var.cipassword
  cicustom     = var.cicustom
  nameserver   = var.nameserver
  searchdomain = var.searchdomain
  ipconfig0    = var.ipconfig0
  ipconfig1    = var.ipconfig1
  ipconfig2    = var.ipconfig2

  sshkeys = <<EOF
        ${var.sshkeys}
        EOF
}

