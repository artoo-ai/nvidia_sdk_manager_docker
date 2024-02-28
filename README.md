# Nvidia sdk_manager_docker

## Introduction

This is a Dockerfile to use [NVIDIA SDK Manager](https://docs.nvidia.com/sdk-manager/) on Docker container.

Ubuntu: 20.04

Nvidia SDKManager: 2.0.0

## Important Information

NVIDIA released official Docker image(<https://docs.nvidia.com/sdk-manager/docker-containers/index.html>).

## Requirements

* Docker

## Preparation

### Download NVIDIA SDK Manager

Please download the package of NVIDIA SDK Manager from <https://developer.nvidia.com/nvidia-sdk-manager>.  
And, please put the package of NVIDIA SDK Manager in the same directory as the Dockerfile.  
This time, I used `sdkmanager_2.0.0-11405_amd64.deb`.

### Build Docker image

```
docker build --build-arg GID=$(id -g) --build-arg UID=$(id -u) -t jetpack .
```

To build a Docker image with a specific SDK Manager version override the ``SDK_MANAGER_VERSION`` variable in the Docker command line

```
docker build --build-arg SDK_MANAGER_VERSION=2.0.0-11405 --build-arg GID=$(id -g) --build-arg UID=$(id -u) -t jetpack .
```

### Create Docker container

```
./launch_container.sh
```

## Launch NVIDIA SDK Manager

Please launch NVIDIA SDK Manager by the following command.

```
sdkmanager
```
or for CLI version in terminal.  I could not get the web browser to load to log in.

```
sdkmanager --cli
```

Download and attempt to install everything.  Install fails, but all the files are downloaded.  Stop SDKManger and run these commands

```bash
cd /home/jetpack/nvidia/nvidia_sdk/JetPack_5.1.3_Linux_JETSON_AGX_XAVIER_TARGETS/Linux_for_Tegra
sudo ./apply_binaries.sh
sudo ./tools/l4t_flash_prerequisites.sh
sudo ./flash.sh jetson-agx-xavier-devkit nvme0n1p1
```


Please refer to <https://docs.nvidia.com/sdk-manager/install-with-sdkm-jetson/index.html>.
And, I tested in the following setting.

* Manual Setup
* OEM Configuration: Runtime

![](image/jetson-os-flash-setting.png)

## Notes

If you get errors like this, it means that QEMU is not installed in host/container

![](image/filesystem-error.png)

To configure QEMU, run below, either on host, or the running container.

```shell
./configure_qemu.sh
```
