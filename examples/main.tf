locals {
  ufr_src_firewall_group_ids = flatten([[module.unifi-fw-addressgroup.ufg-id], [], [module.unifi-fw-portgroup.ufg-id]])
  ufr_src_network_id_format = element(module.unifi-net-vlan.un-id, 0)
}

module "unifi-fw-addressgroup" {
  source = "../modules/terraform-unifi-controller"

  ufg_enable  = true
  ufg_name    = "UFG-ADDRESS-GROUP-TEST"
  ufg_type    = "address-group"
  ufg_members = ["10.16.15.227", "10.16.15.228"]
}

module "unifi-fw-portgroup" {
  source = "../modules/terraform-unifi-controller"

  ufg_enable  = true
  ufg_name    = "UFG-PORT-GROUP-TEST"
  ufg_type    = "port-group"
  ufg_members = ["6007", "8006"]
}

module "unifi-fw-rule" {
  source = "../modules/terraform-unifi-controller"

  ufr_enable = true
  # Required
  ufr_name     = "UFR-RULE-TEST"
  ufr_action   = "drop"
  ufr_protocol = "tcp"

  ufr_rule_index = "2016"
  ufr_ruleset    = "LAN_IN" #in GUI 

  # Optional - Source
  #ufr_src_address = "172.16.80.227" # Use when GUI Source type is IP Address
  ufr_src_firewall_group_ids = [] # use this if you want an any any rule
  #ufr_src_firewall_group_ids = local.ufr_src_firewall_group_ids # need to flatten it in local block  # if you want to use group ids only this no address of network type
  #ufr_src_mac = ""
  #ufr_src_network_id = jsonencode(module.unifi-net-vlan.un-id) # If you want to do vlan to vlan no address or firewall group
  #ufr_src_network_type = "ADDRv4"

  # Optional - Destination
  ufr_dst_address = "10.16.80.227"
  #ufr_dst_firewall_group_ids = ["any"]
  #ufr_dst_network_id = "any"
  #ufr_dst_network_type = "ADDRv4"

  # Optional - Advanced
  #ufr_logging = true
  #ufr_state_new = false
  #ufr_state_established = false
  #ufr_state_invalid = false
  #ufr_state_related = false
  #ufr_ip_sec = "match-none"
}

module "unifi-fw-rule1" {
  source = "../modules/terraform-unifi-controller"

  ufr_enable = true
  # Required
  ufr_name     = "UFR-RULE-TEST1"
  ufr_action   = "drop"
  ufr_protocol = "tcp"

  ufr_rule_index = "2017"
  ufr_ruleset    = "LAN_IN" #type in GUI

  # Optional - Source
  #ufr_src_address = "172.16.80.227" # Use when GUI Source type is IP Address
  #ufr_src_firewall_group_ids = [] # use this if you want an any any rule
  #ufr_src_firewall_group_ids = local.ufr_src_firewall_group_ids # need to flatten it in local block  # if you want to use group ids only this no address of network type
  #ufr_src_mac = ""
  ufr_src_network_id = local.ufr_src_network_id_format # If you want to do vlan to vlan no address or firewall group
  #ufr_src_network_id = jsonencode(module.unifi-net-vlan.un-id) # If you want to do vlan to vlan no address or firewall group
  #ufr_src_network_type = "ADDRv4"

  # Optional - Destination
  ufr_dst_address = "10.16.80.227"
  #ufr_dst_firewall_group_ids = ["any"]
  #ufr_dst_network_id = "any"
  #ufr_dst_network_type = "ADDRv4"

  # Optional - Advanced
  #ufr_logging = true
  #ufr_state_new = false
  #ufr_state_established = false
  #ufr_state_invalid = false
  #ufr_state_related = false
  #ufr_ip_sec = "match-none"
}

module "unifi-net-vlan" {
  source = "../modules/terraform-unifi-controller"

  un_enable = true

  # Required 
  un_name    = "TEST-VLAN"
  un_purpose = "corporate"

  # Optional
  #un_dhcp_dns = 
  un_dhcp_enabled = true
  #un_dhcp_lease = 
  un_dhcp_start = "10.0.0.6"
  un_dhcp_stop  = "10.0.0.254"
  #un_domain_name = 
  #un_igmp_snooping = 
  #un_ipv6_interface_type = 
  #un_ipv6_pd_interface = 
  #un_ipv6_pd_prefixid = 
  #un_ipv6_ra_enable = 
  #un_ipv6_static_subnet = 
  #un_network_group = 
  un_subnet  = "10.0.0.1/24"
  un_vlan_id = 250
  #un_wan_egress_qos = 
  #un_wan_ip = 
  #un_wan_networkgroup = 
  #un_wan_type = 
  #un_wan_username = 
  #un_x_wan_password = 
}