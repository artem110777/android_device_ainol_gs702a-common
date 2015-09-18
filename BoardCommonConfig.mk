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

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a5
TARGET_CPU_VARIANT := cortex-a5
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
BOARD_VENDOR := ainol
TARGET_BOARD_PLATFORM := ATM702X
TARGET_BOARD_PLATFORM_GPU := VIVANTE
TARGET_SOC := gs702a
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true

# Audio
BOARD_USES_ACTIONS_AUDIO := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ATM702X
TARGET_NO_BOOTLOADER := true

# Camera
USE_CAMERA_STUB := true

# Display
BOARD_USES_ACTIONS_DISPLAY := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Filesystem
BOARD_NAND_PAGE_SIZE := 4096
BOARD_NAND_SPARE_SIZE := 128
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 536870912
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Graphics
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
BOARD_USES_HGL := true
BOARD_USES_OVERLAY := true
USE_OPENGL_RENDERER := true
BOARD_USE_SKIA_LCDTEXT := true
TARGET_BOOTANIMATION_PRELOAD := true

# HDMI
BOARD_USES_ACTIONS_HDMI := true

# Kernel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel/kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.console=null
BOARD_PAGE_SIZE := 2048

# Sensor
BOARD_USES_ACTIONS_SENSOR := true

# Radio
TARGET_NO_RADIOIMAGE := true

# Recovery
# CWM:
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/twrp.fstab
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_565
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_UMS_LUNFILE := "/sys/class/android_usb/android0/f_mass_storage/lun0/file"
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := "/sys/class/backlight/act_pwm_backlight/brightness"
# TWRP:
RECOVERY_SDCARD_ON_DATA := false
BOARD_HAS_NO_REAL_SDCARD := false
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TWHAVE_SELINUX := false
TW_NO_REBOOT_BOOTLOADER := true
TW_INTERNAL_STORAGE_PATH := "/dev/block/actj"
TW_INTERNAL_STORAGE_MOUNT_POINT := "/sdcard"
TW_EXTERNAL_STORAGE_PATH := "/dev/block/mmcblk0"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "/sd-ext"
TW_DEFAULT_EXTERNAL_STORAGE := false
TW_MAX_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := "/sys/class/backlight/act_pwm_backlight/brightness"

# Releasetool
TARGET_RELEASETOOLS_EXTENSIONS := device/ainol/gs702a-common
