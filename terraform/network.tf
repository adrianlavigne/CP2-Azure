resource "azurerm_virtual_network" "myNet" {
        name = "kubernetesnet"
        address_space = ["10.0.0.0/16"]
        location = azurerm_resource_group.rg.location
        resource_group_name = azurerm_resource_group.rg.name
        tags = {
                environment = "CP2"
        }
}

resource "azurerm_subnet" "mySubnet" {
        name = "terraformsubnet"
        resource_group_name = azurerm_resource_group.rg.name
        virtual_network_name = azurerm_virtual_network.myNet.name
        address_prefixes = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "nicMaster" {
        name = "nic-master"
        location = azurerm_resource_group.rg.location
        resource_group_name = azurerm_resource_group.rg.name

        ip_configuration {
                name = "ipcofig-master"
                subnet_id = azurerm_subnet.mySubnet.id
                private_ip_address_allocation = "Static"
                private_ip_address = "10.0.1.10"
                public_ip_address_id = azurerm_public_ip.masterPublicIp.id
        }

        tags = {
                environment = "CP2"
        }
}

resource "azurerm_network_interface" "nicWorker" {
        name = "nic-worker"
        location = azurerm_resource_group.rg.location
        resource_group_name = azurerm_resource_group.rg.name

        ip_configuration {
                name = "ipcofig-worker"
                subnet_id = azurerm_subnet.mySubnet.id
                private_ip_address_allocation = "Static"
                private_ip_address = "10.0.1.11"
                public_ip_address_id = azurerm_public_ip.workerPublicIp.id
        }

        tags = {
                environment = "CP2"
        }
}

resource "azurerm_public_ip" "masterPublicIp" {
        name = "vmip-master"
        location = azurerm_resource_group.rg.location
        resource_group_name = azurerm_resource_group.rg.name
        allocation_method = "Dynamic"
        sku = "Basic"

        tags = {
                environment = "CP2"
        }

}

resource "azurerm_public_ip" "workerPublicIp" {
        name = "vmip-worker"
        location = azurerm_resource_group.rg.location
        resource_group_name = azurerm_resource_group.rg.name
        allocation_method = "Dynamic"
        sku = "Basic"

        tags = {
                environment = "CP2"
        }

}
                                                                                                                                                                                            64,0-1        79%
