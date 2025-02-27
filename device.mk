#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_shimaidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/audio_platform_info_shimaidp.xml \
    $(LOCAL_PATH)/audio/mixer_paths_shimaidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/mixer_paths_shimaidp.xml \
    $(LOCAL_PATH)/audio/mixer_paths_overlay_dynamic.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/mixer_paths_overlay_dynamic.xml \
    $(LOCAL_PATH)/audio/mixer_paths_overlay_static.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/mixer_paths_overlay_static.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_shimaidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/sound_trigger_mixer_paths_shimaidp.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_shima/sound_trigger_platform_info.xml

# Display
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display_id_4630946545580055170.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630946545580055170.xml

# Kernel
TARGET_KERNEL_DIR ?= device/xiaomi/renoir-kernel
TARGET_PREBUILT_KERNEL := $(TARGET_KERNEL_DIR)/Image
PRODUCT_COPY_FILES += $(TARGET_PREBUILT_KERNEL):kernel

PRODUCT_VENDOR_KERNEL_HEADERS += device/xiaomi/renoir-kernel/kernel-headers

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-statix

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Rootdir
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.renoir.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.renoir.rc

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/renoir/renoir-vendor.mk)
