# Inherit for devices that support 64-bit primary and 32-bit secondary zygote startup script
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Set target and base project for flavor build
MTK_TARGET_PROJECT := $(subst full_,,$(TARGET_PRODUCT))
MTK_BASE_PROJECT := $(MTK_TARGET_PROJECT)
MTK_PROJECT_FOLDER := $(LOCAL_PATH)
MTK_TARGET_PROJECT_FOLDER := $(LOCAL_PATH)

# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# set locales & aapt config.
include $(LOCAL_PATH)/ProjectConfig.mk
PRODUCT_LOCALES:=ru_RU en_US


# Set those variables here to overwrite the inherited values.
PRODUCT_MANUFACTURER := Homtom
PRODUCT_NAME := full_F509
PRODUCT_DEVICE := F509
PRODUCT_MODEL := HT17Pro
PRODUCT_POLICY := android.policy_phone
PRODUCT_BRAND := Homtom
TARGET_OTA_ASSERT_DEVICE := F509

ifeq ($(TARGET_BUILD_VARIANT), eng)
KERNEL_DEFCONFIG ?= F509_debug_defconfig
else
KERNEL_DEFCONFIG ?= F509_defconfig
endif
#PRELOADER_TARGET_PRODUCT ?= F509
#LK_PROJECT ?= F509
#TRUSTY_PROJECT ?= F509

#A-GO
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackageGo.mk)

include $(LOCAL_PATH)/twrp.mk

