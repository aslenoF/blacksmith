# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/LineageOS/android.git -b lineage-17.1 -g default,-mips,-darwin,-notdefault
git clone https://github.com/aslenofarid/local_manifest.git --depth 1 -b lineage-17.1 .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync1 -j8

# build rom
source build/envsetup.sh
lunch lineage_X00TD-userdebug
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=aslenofarid
export KBUILD_BUILD_HOST=android-build
export BUILD_USERNAME=aslenofarid
export BUILD_HOSTNAME=android-build
mka bacon -j8
