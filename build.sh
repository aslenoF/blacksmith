#sync rom
repo init --depth=1 --no-repo-verify -u $source -b $branch -g default,-mips,-darwin,-notdefault
git clone $local_manifest --depth 1 -b $branch .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync1 -j8

# build rom
source build/envsetup.sh
lunch rom_codename-buildtype
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=
export KBUILD_BUILD_HOST=
export BUILD_USERNAME=
export BUILD_HOSTNAME=
make bacon -j8
