variable "vm_size" {
        type = string
        description = "Tamaño de la máquina virtual(master)"
        default = "Standard_B2s" # 4 Gb, 2 CPU
}

variable "vms" {
        description = "Máquinas virtuales a crear"
        type = list(string)
        default = ["worker01", "master", "worker02", "nfs"] # Reordered to fit the size(worker vm_size1, master and nfs vm_size2)
}
