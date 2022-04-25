locals {
  # vm_disk
  vm_disk                     = var.vm_disk
  vm_disk_default_type        = var.vm_disk_default_type
  vm_disk_default_storage     = var.vm_disk_default_storage
  vm_disk_default_size        = var.vm_disk_default_size
  vm_disk_default_format      = var.vm_disk_default_format
  vm_disk_default_cache       = var.vm_disk_default_cache
  vm_disk_default_backup      = var.vm_disk_default_backup
  vm_disk_default_iothread    = var.vm_disk_default_iothread
  vm_disk_default_replicate   = var.vm_disk_default_replicate
  vm_disk_default_ssd         = var.vm_disk_default_ssd
  vm_disk_default_discard     = var.vm_disk_default_discard
  vm_disk_default_mbps        = var.vm_disk_default_mbps
  vm_disk_default_mbps_rd     = var.vm_disk_default_mbps_rd
  vm_disk_default_mbps_rd_max = var.vm_disk_default_mbps_rd_max
  vm_disk_default_mbps_wr     = var.vm_disk_default_mbps_wr
  vm_disk_default_mbps_wr_max = var.vm_disk_default_mbps_wr_max

  vm_disk_default_file         = var.vm_disk_default_file
  vm_disk_default_media        = var.vm_disk_default_media
  vm_disk_default_volume       = var.vm_disk_default_volume
  vm_disk_default_storage_type = var.vm_disk_default_storage_type

  # vm_network
  vm_network                   = var.vm_network
  vm_network_default_model     = var.vm_network_default_model
  vm_network_default_macaddr   = var.vm_network_default_macaddr
  vm_network_default_bridge    = var.vm_network_default_bridge
  vm_network_default_tag       = var.vm_network_default_tag
  vm_network_default_firewall  = var.vm_network_default_firewall
  vm_network_default_rate      = var.vm_network_default_rate
  vm_network_default_queues    = var.vm_network_default_queues
  vm_network_default_link_down = var.vm_network_default_link_down

  # lifecycle - not in use
  // vm_lifecycle {
  //   ignore_changes = var.ignore_changes
  //   create_before_destroy = var.prevent_destroy ? 1 : 0
  //   prevent_destroy = var.prevent_destroy ? 1 : 0
  // }
}
