output "admin_username" {
  value = var.admin_username
}

output "public_ip" {
  description = "IP público da VM"
  value       = azurerm_public_ip.pip.ip_address
}

output "ssh_command_hint" {
  value = "ssh -i ~/.ssh/sysfac_vm_id_rsa ${var.admin_username}@${azurerm_public_ip.pip.ip_address}"
}
