#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from giuliac device
$(call inherit-product, device/oneplus/giuliac/device.mk)

# Inherit some common Lineage stuff.
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Axion flags
AXION_MAINTAINER := Genoxci
AXION_PROCESSOR := Snapdragon®_8_Gen_3
AXION_CAMERA_FRONT_INFO := 16
AXION_CAMERA_REAR_INFO := 50,8,2
TARGET_ENABLE_BLUR := true
TORCH_STR_SUPPORTED := true

PERF_GOV_SUPPORTED := true
PERF_DEFAULT_GOV := walt
GPU_FREQS_PATH := /sys/class/kgsl/kgsl-3d0/devfreq/available_frequencies
GPU_MIN_FREQ_PATH := /sys/class/kgsl/kgsl-3d0/devfreq/min_freq

# Device identifier
PRODUCT_NAME := lineage_giuliac
PRODUCT_DEVICE := giuliac
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := PKG110

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="qssi-user 16 BP2A.250605.015 1767889607989 release-keys" \
    BuildFingerprint=OnePlus/PKG110/OP5D2BL1:16/UKQ1.231108.001/V.1f672c7_296bea_2963ce:user/release-keys \
    DeviceName=OP5D2BL1 \
    DeviceProduct=PKG110 \
    SystemDevice=OP5D2BL1 \
    SystemName=PKG110
