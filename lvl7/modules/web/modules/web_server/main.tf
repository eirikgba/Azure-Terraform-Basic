resource "azurerm_network_interface" "nic" {
    count               = var.nr_web_server
    name                = "nic-${count.index}"
    location            = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
        name                          = "Internal"
        subnet_id                     = var.subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_linux_virtual_machine" "ubuntu-web" {
    count                       = var.nr_web_server
    name                        = "web-server-${count.index}"
    resource_group_name         = var.resource_group_name
    location                    = var.location
    size                        = var.size
    admin_username              = var.admin_usrname
    network_interface_ids       = [
        element(azurerm_network_interface.nic.*.id, count.index)
    ]

    admin_ssh_key {
        username    = var.admin_usrname
        public_key  = file("~/.ssh/id_rsa.pub")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = var.publisher
        offer     = var.offer
        sku       = var.image_sku
        version   = "latest"
    }

}