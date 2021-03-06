variable "resource_group_name" {
    type    = string
    default = ""
}


variable "location" {
    type    = string
    default = ""
}

variable "nr_web_server" {
    type    = number
}

variable "subnet_id" {
    type    = string
    default = ""
}

#VM variable
variable "size" {
    type    = string
    default = "Standard_F2"
}

variable "admin_usrname" {
    type    = string
    default = "admin-eirikgb"
}

variable "publisher" {
    type    = string
    default = "Canonical"
}

variable "offer" {
    type    = string 
    default = "UbuntuServer"
}

variable "image_sku" {
    type    = string
    default = "16.04-LTS"
}