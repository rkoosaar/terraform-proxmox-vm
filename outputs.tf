###  test-vm-dns = proxmox_vm_qemu.proxmox_vm1[count.index],
###  test-vm-ip = proxmox_vm_qemu.proxmox_vm1[count.index],
###  test-prx-vm-dns = proxmox_vm_qemu.proxmox_vm2[count.index],
###  test-prx-vm-ip = proxmox_vm_qemu.proxmox_vm2[count.index],
###  test-prx-vm-id = proxmox_vm_qemu.proxmox_vm2
###  virtualmachine-ip = proxmox_vm_qemu.virtualmachine.ipconfig0,
### [bastion]
### ${bastion-dns} ansible_host=${bastion-ip} # ${bastion-id}

### [servers]
### %{ for index, dns in private-dns ~}
### ${dns} ansible_host=${private-ip[index]} # ${private-id[index]}
### %{ endfor ~}

### The Ansible inventory file

#resource "local_file" "AnsibleInventory" {
#  content = templatefile("inventory.tmpl",
#    {
#      virtualmachine-name   = "${element(proxmox_vm_qemu.virtualmachine.*.name, 0)}",
#      virtualmachine-domain = "${element(proxmox_vm_qemu.virtualmachine.*.searchdomain, 0)}"
#    }
#  )
#  filename = "../inventory/hosts"
#}