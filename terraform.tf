terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "3.8.0"
    }
  }
}

variable "tokenlinode" {

  type = string

}

variable "deploymentobject" {

  type = list (object ( {

    region = string
    tag = string
    password = string
    type = string

  }) )
}

provider "linode" {
  # Configuration options
  token = var.tokenlinode
}



resource "linode_instance" "miner1" {
  label           = "miner1"
  image           = "linode/Ubuntu25.10"
  region          = var.deploymentobject[0].region
  type            = var.deploymentobject[0].type

  root_pass       = var.deploymentobject[0].password

  tags       = [var.deploymentobject[0].tag]
  swap_size  = 256
  private_ip = true
}


resource "linode_instance" "miner2" {
  label           = "miner2"
  image           = "linode/Ubuntu25.10"
  region          = var.deploymentobject[1].region
  type            = var.deploymentobject[1].type

  root_pass       = var.deploymentobject[1].password

  tags       = [var.deploymentobject[1].tag]
  swap_size  = 256
  private_ip = true

}





