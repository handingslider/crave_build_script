# ROM Build commands for Poco X6 Pro 5G Duchamp

# Remove local_manifests

rm -rf .repo/local_manifests

# Repo init
repo init -u https://github.com/LineageOS/android.git -b lineage-22.2 --git-lfs

# Repo sync
/opt/crave/resync.sh

# Remove old device specific repos
rm -rf device/xiaomi/duchamp
rm -rf vendor/xiaomi/duchamp
rm -rf kernel/xiaomi/mt6897
rm -rf hardware/xiaomi
rm -rf device/mediatek/sepolicy_vndr
rm -rf device/xiaomi/duchamp-kernel
rm -rf hardware/mediatek

# Clone new device specific repos
git clone https://github.com/mt6897-devs/device_xiaomi_duchamp device/xiaomi/duchamp 
git clone https://github.com/mt6897-devs/device_xiaomi_duchamp-kernel device/xiaomi/duchamp-kernel
git clone https://github.com/mt6897-devs/vendor_xiaomi_duchamp vendor/xiaomi/duchamp

git clone https://github.com/mt6897-devs/android_kernel_6.1 kernel/xiaomi/mt6897 --depth=1

git clone https://github.com/mt6897-devs/device_mediatek_sepolicy_vndr device/mediatek/sepolicy_vndr
git clone https://github.com/mt6897-devs/hardware_mediatek hardware/mediatek
git clone https://github.com/mt6897-devs/hardware_xiaomi hardware/xiaomi

. build/envsetup.sh
breakfast duchamp && mka bacon
