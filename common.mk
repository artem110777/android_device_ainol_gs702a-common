LOCAL_PATH := device/ainol/gs702a-common

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Audio configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:/system/etc/audio_policy.conf

# Feature live wallpaper
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml	
	
# Filesystem management tools
PRODUCT_PACKAGES += \
    static_busybox \
    make_ext4fs \
    e2fsck \
    mke2fs \
    ping \
    strace \
    com.android.future.usb.accessory \
    charger \
    charger_res_images \
    usbmond

# GSensor
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/excluded-input-devices.xml:system/etc/excluded-input-devices.xml
	
# Init files
PRODUCT_COPY_FILES := \
    $(LOCAL_PATH)/rootdir/lib/modules/atv5202_mmc.ko:root/lib/modules/atv5202_mmc.ko \
    $(LOCAL_PATH)/rootdir/lib/modules/blk1drv.ko:root/lib/modules/blk1drv.ko \
    $(LOCAL_PATH)/rootdir/lib/modules/blk2drv.ko:root/lib/modules/blk2drv.ko \
    $(LOCAL_PATH)/rootdir/lib/modules/mmc_core.ko:root/lib/modules/mmc_core.ko \
    $(LOCAL_PATH)/rootdir/lib/modules/tsd_block.ko:root/lib/modules/tsd_block.ko \
    $(LOCAL_PATH)/rootdir/fstab.gs702a:root/fstab.gs702a \
    $(LOCAL_PATH)/rootdir/fstab.sdboot.gs702a:root/fstab.sdboot.gs702a \
    $(LOCAL_PATH)/rootdir/init.gs702a.rc:root/init.gs702a.rc \
    $(LOCAL_PATH)/rootdir/init.gs702a.sdboot.rc:root/init.gs702a.sdboot.rc \
    $(LOCAL_PATH)/rootdir/init.gs702a.usb.rc:root/init.gs702a.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.gs702a.rc:root/ueventd.gs702a.rc \
    $(LOCAL_PATH)/rootdir/usbmond.sh:root/usbmond.sh \
    $(LOCAL_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab \
    $(LOCAL_PATH)/recovery/init.recovery.gs702a.rc:recovery/root/init.recovery.gs702a.rc
	
# Keylayout and Idc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/atc260x-adckeypad.kl:system/usr/keylayout/atc260x-adckeypad.kl \
    $(LOCAL_PATH)/idc/ft5x0x_ts.idc:system/usr/idc/ft5x0x_ts.idc \
    $(LOCAL_PATH)/idc/GT813.idc:system/usr/idc/GT813.idc \
    $(LOCAL_PATH)/idc/mt395.idc:system/usr/idc/mt395.idc
	
# Live Wallpapers
PRODUCT_PACKAGES += \
    Galaxy4 \
    HoloSpiralWallpaper \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    NoiseField \
    PhaseBeam \
    VisualizationWallpapers \
    librs_jni	
	
# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# OMX
PRODUCT_PACKAGES += \
    libstagefrighthw

# OMX configuration file
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/omx_codec.xml:system/etc/omx_codec.xml
	
# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage
	
# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml
	
# Vold and Storage
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/configs/vold.sdboot.fstab:system/etc/vold.sdboot.fstab	
	
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=0 \
    ro.opengles.version=131072 \
    hwui.render_dirty_regions=false

PRODUCT_TAGS += dalvik.gc.type-precise	

PRODUCT_CHARACTERISTICS := tablet
