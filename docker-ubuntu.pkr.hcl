// The packer {} block contains Packer settings, including specifying a required Packer version.
packer {
  // Each plugin block contains a version and source attribute.
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

variable "docker_image" {
  type    = string
  default = "ubuntu:xenial"
}

// The source block configures a specific builder plugin, which is then invoked by a build block.
// In the example template, the builder type is docker and the name is ubuntu-xenial.
source "docker" "ubuntu-xenial" {
  image  = var.docker_image
  commit = true
}

source "docker" "ubuntu-bionic" {
  image  = "ubuntu:bionic"
  commit = true
}


build {
  name = "learn-packer"
  sources = [
    "source.docker.ubuntu-xenial",
    "source.docker.ubuntu-bionic",
  ]

  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo Adding file to Docker Container",
      "echo \"FOO is $FOO\" > example.txt",
    ]
  }

  provisioner "shell" {
    inline = ["echo Running ${var.docker_image} Docker image."]
  }

  post-processor "docker-tag" {
    repository = "learn-packer"
    tags       = ["ubuntu-xenial"]
    only       = ["docker.ubuntu-xenial"]
  }

  post-processor "docker-tag" {
    repository = "learn-packer"
    tags       = ["ubuntu-bionic"]
    only       = ["docker.ubuntu-bionic"]
  }

}
