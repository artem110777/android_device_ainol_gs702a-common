#
# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/ainol/gs702a-common

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# AAPT config
# gs702a devices is mdpi.
PRODUCT_AAPT_CONFIG += xlarge mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Actions Hardware
PRODUCT_PACKAGES := \
    actions \
    libactions_runtime

# Filesystem management tools
PRODUCT_PACKAGES := \
    charger \
    charger_res_images \
    com.android.future.usb.accessory \
    make_ext4fs \
    netperf \
    netserver \
    setup_fs \
    static_busybox

# H/W
PRODUCT_PACKAGES := \
    audio.r_submix.default \
    audio.policy.default \
    audio.primary.ATM702X \
    displayengine.ATM702X \
    hdmi.ATM702X \
    lights.ATM702X \
    sensors.ATM702X

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/lib/modules/blk1drv.ko:root/lib/modules/blk1drv.ko \
    $(LOCAL_PATH)/rootdir/lib/modules/blk2drv.ko:root/lib/modules/blk2drv.ko \
    $(LOCAL_PATH)/rootdir/lib/modules/tsd_block.ko:root/lib/modules/tsd_block.ko \
    $(LOCAL_PATH)/rootdir/fstab.gs702a:root/fstab.gs702a \
    $(LOCAL_PATH)/rootdir/init.gs702a.rc:root/init.gs702a.rc \
    $(LOCAL_PATH)/rootdir/init.gs702a.usb.rc:root/init.gs702a.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.gs702a.rc:root/ueventd.gs702a.rc
	
# Keylayout and Idc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/atc260x-adckeypad.kl:system/usr/keylayout/atc260x-adckeypad.kl \
    $(LOCAL_PATH)/idc/ft5x0x_ts.idc:system/usr/idc/ft5x0x_ts.idc
	
# Live Wallpapers
PRODUCT_PACKAGES := \
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
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/omx_codec.xml:system/etc/omx_codec.xml

# Product override
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_CHARACTERISTICS := tablet

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage
	
# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
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
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
	
# Vold for storages
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=120

# .prop override
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=0 \
    ro.opengles.version=131072
    
$(call inherit-product-if-exists, vendor/ainol/gs702a-common/gs702a-common-vendor.mk)
