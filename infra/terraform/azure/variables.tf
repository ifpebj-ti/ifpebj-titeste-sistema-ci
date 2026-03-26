# =========================
# Projeto e Região
# =========================
variable "project_name" {
  description = "Prefixo/slug do projeto (usado para nomear recursos)."
  type        = string
  default     = "sysfac"
}

variable "location" {
  description = "Região da Azure."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Nome do Resource Group."
  type        = string
  default     = "RG-FABRICA-SOFTWARE"
}

# =========================
# Configuração da VM
# =========================
variable "vm_size" {
  description = "SKU/tamanho da VM."
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Usuário admin da VM."
  type        = string
  default     = "azureuser"
}

variable "os_disk_type" {
  description = "Tipo do disco do SO."
  type        = string
  default     = "Standard_LRS"
}

variable "os_disk_size_gb" {
  description = "Tamanho do disco do SO em GB."
  type        = number
  default     = 64
}

# =========================
# Rede e Segurança
# =========================
variable "allowed_ssh_cidrs" {
  description = "Lista de CIDRs permitidos para SSH (22). Ideal restringir ao seu IP."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# =========================
# SSH - Chave pública (vinda da pipeline)
# =========================
variable "ssh_public_key" {
  description = "Chave pública SSH gerada pela pipeline (usada na criação da VM)."
  type        = string
}

# =========================
# Tags
# =========================
variable "tags" {
  description = "Tags padrão para os recursos."
  type        = map(string)
  default = {
    project = "sysfac"
    owner   = "tcc"
  }
}
