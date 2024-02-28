sudo apt install qemu-user-static sshpass abootimg nfs-kernel-server libxml2-utils

wget https://developer.nvidia.com/downloads/embedded/l4t/r35_release_v5.0/release/jetson_linux_r35.5.0_aarch64.tbz2
wget https://developer.nvidia.com/downloads/embedded/l4t/r35_release_v5.0/release/tegra_linux_sample-root-filesystem_r35.5.0_aarch64.tbz2
wget https://developer.nvidia.com/downloads/embedded/l4t/r35_release_v5.0/overlay_xusb_35.5.0.tbz2

export L4T_RELEASE_PACKAGE=jetson_linux_r35.5.0_aarch64.tbz2
export SAMPLE_FS_PACKAGE=tegra_linux_sample-root-filesystem_r35.5.0_aarch64.tbz2
export BOARD=jetson-agx-xavier-devkit

tar xvf ${L4T_RELEASE_PACKAGE}
sudo tar xvpf ${SAMPLE_FS_PACKAGE} -C Linux_for_Tegra/rootfs/
tar xvf overlay_xusb_35.5.0.tbz2

#cd /home/jetpack/nvidia/nvidia_sdk/JetPack_5.1.3_Linux_JETSON_AGX_XAVIER_TARGETS/Linux_for_Tegra
cd Linux_for_Tegra
sudo ./apply_binaries.sh
sudo ./tools/l4t_flash_prerequisites.sh

#sudo ./tools/kernel_flash/l4t_initrd_flash.sh --external-device nvme0n1p1 \
#-c tools/kernel_flash/flash_l4t_external.xml -p "-c bootloader/t186ref/cfg/flash_t234_qspi.xml" \
#--showlogs --network usb0 jetson-agx-xavier-devkit internal

sudo ./flash.sh jetson-agx-xavier-devkit nvme0n1p1