packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source  = "github.com/hashicorp/docker"
    }
  }
}

variable "docker_registry" {
  type    = string
  default = "docker.artifactory.parsons.us"
}

variable "docker_image" {
  type    = string
  default = "rockylinux"
}

variable "docker_tag" {
  type    = string
  default = "8"
}

source "docker" "rockylinux8" {
  image  = "${var.docker_registry}/${var.docker_image}:${var.docker_tag}"
  commit = true
}

build {
  name = "learn-packer"
  sources = [
    "source.docker.rockylinux8",
  ]

  // output into file
  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo Adding file to Docker Container",
      "echo \"FOO is $FOO\" > example.txt",
    ]
  }

  // output to screen
  provisioner "shell" {
    inline = ["echo Running ${var.docker_image} Docker image."]
  }

  // adjust docker name/tag
  post-processor "docker-tag" {
    repository = "${var.docker_registry}/parsons/${var.docker_image}"
    tags       = ["PAR.123"]
    only       = ["docker.rockylinux8"]
  }

}
