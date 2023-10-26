# hashiCorp_packer_tutorial

<https://learn.hashicorp.com/tutorials/packer/docker-get-started-build-image?in=packer/docker-get-started>

## install packer

URL: <https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli>

Windows

```none
choco upgrade -y packer
```

EL8 Linux

```none
sudo yum -y install packer
```

## packer init

This will install the defined plugins. Can run over and over

```none
$ packer init .
Installed plugin github.com/hashicorp/docker v1.0.8 in "/home/vagrant/.config/packer/plugins/github.com/hashicorp/docker/packer-plugin-docker_v1.0.8_x5.0_linux_amd64"
```

## packer format validate

The packer fmt command updates templates in the current directory for readability and consistency.

```none
$ packer fmt .
docker-ubuntu.pkr.hcl
```

## packer validate validate

Confirm configuration is syntactically valid and internally consistent.

```none
$ packer validate .
The configuration is valid.
```

## packer build

```none
$ packer build ./docker-rockylinux8.pkr.hcl
learn-packer.docker.rockylinux8: output will be in this color.

==> learn-packer.docker.rockylinux8: Creating a temporary directory for sharing data...
==> learn-packer.docker.rockylinux8: Pulling Docker image: docker.artifactory.parsons.us/rockylinux:8
    learn-packer.docker.rockylinux8: 8: Pulling from rockylinux
    learn-packer.docker.rockylinux8: 5461c86c2e54: Pulling fs layer
    learn-packer.docker.rockylinux8: 5461c86c2e54: Verifying Checksum
    learn-packer.docker.rockylinux8: 5461c86c2e54: Download complete
    learn-packer.docker.rockylinux8: 5461c86c2e54: Pull complete
    learn-packer.docker.rockylinux8: Digest: sha256:80fccd745a0f0ce80e02a50c271c6b59e85d780c47759edb2e5f4f0f4d73e31a
    learn-packer.docker.rockylinux8: Status: Downloaded newer image for docker.artifactory.parsons.us/rockylinux:8
    learn-packer.docker.rockylinux8: docker.artifactory.parsons.us/rockylinux:8
==> learn-packer.docker.rockylinux8: Starting docker container...
    learn-packer.docker.rockylinux8: Run command: docker run -v /home/vagrant/.config/packer/tmp1747260915:/packer-files -d -i -t --entrypoint=/bin/sh -- docker.artifactory.parsons.us/rockylinux:8
    learn-packer.docker.rockylinux8: Container ID: 78b49d30063ede66892191aafb36f79ee6cb625f5c3e7ae6c64ccca9dba2f5ce
==> learn-packer.docker.rockylinux8: Using docker communicator to connect: 172.17.0.2
==> learn-packer.docker.rockylinux8: Provisioning with shell script: /opt/tmp/packer-shell1712575686
    learn-packer.docker.rockylinux8: Adding file to Docker Container
==> learn-packer.docker.rockylinux8: Provisioning with shell script: /opt/tmp/packer-shell1935538563
    learn-packer.docker.rockylinux8: Running rockylinux Docker image.
==> learn-packer.docker.rockylinux8: Committing the container
    learn-packer.docker.rockylinux8: Image ID: sha256:16c6457b00fb2d6d40e4f2db96583fc63b1db921b63a7c9deac9c0f87612cc0d
==> learn-packer.docker.rockylinux8: Killing the container: 78b49d30063ede66892191aafb36f79ee6cb625f5c3e7ae6c64ccca9dba2f5ce
==> learn-packer.docker.rockylinux8: Running post-processor:  (type docker-tag)
    learn-packer.docker.rockylinux8 (docker-tag): Tagging image: sha256:16c6457b00fb2d6d40e4f2db96583fc63b1db921b63a7c9deac9c0f87612cc0d
    learn-packer.docker.rockylinux8 (docker-tag): Repository: docker.artifactory.parsons.us/parsons/rockylinux:PAR.123
Build 'learn-packer.docker.rockylinux8' finished after 11 seconds 193 milliseconds.

==> Wait completed after 11 seconds 193 milliseconds

==> Builds finished. The artifacts of successful builds are:
--> learn-packer.docker.rockylinux8: Imported Docker image: sha256:16c6457b00fb2d6d40e4f2db96583fc63b1db921b63a7c9deac9c0f87612cc0d
--> learn-packer.docker.rockylinux8: Imported Docker image: docker.artifactory.parsons.us/parsons/rockylinux:PAR.123 with tags docker.artifactory.parsons.us/parsons/rockylinux:PAR.123
```

## docker builder plugin

<https://developer.hashicorp.com/packer/plugins/builders/docker>
