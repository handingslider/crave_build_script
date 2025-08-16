# ROM Build commands for Mi 11 Lite 5G renoir

# Remove local_manifests

rm -rf .repo/local_manifests

# Repo init
repo init -u https://github.com/LineageOS/android.git -b lineage-22.2 --git-lfs

# Repo sync
/opt/crave/resync.sh

# Remove old device specific repos
rm -rf device/xiaomi/duchamp
rm -rf vendor/xiaomi/duchamp
rm -rf kernel/xiaomi/duchamp
rm -rf hardware/xiaomi

# Clone new device specific repos

# Device configuration
git clone https://github.com/mt6897-devs/device_xiaomi_duchamp.git device/xiaomi/duchamp

# Vendor tree
git clone https://github.com/mt6897-devs/vendor_xiaomi_duchamp vendor/xiaomi/duchamp

# Kernel Tree
git clone https://github.com/mt6897-devs/android_kernel_6.1 kernel/xiaomi/duchamp

# Hardware
git clone https://github.com/mt6897-devs/hardware_xiaomi hardware/xiaomi

. build/envsetup.sh
breakfast duchamp && mka bacon
