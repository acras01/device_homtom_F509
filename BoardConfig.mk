TARGET_BOARD_PLATFORM := mt6737m
DEVICE_PATH := device/homtom/F509

# Use the non-open-source part, if present
-include vendor/mediatek/F509/BoardConfigVendor.mk

# Use the 6735 common part
include device/mediatek/mt6735/BoardConfig.mk

#Config partition size
-include $(MTK_PTGEN_OUT)/partition_size.mk
ifneq ($(strip $(MTK_AB_OTA_UPDATER)), yes)
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
endif
BOARD_MTK_SYSTEM_SIZE_KB := 2560000
BOARD_FLASH_BLOCK_SIZE := 4096

# Legacy BLOB Support
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
#TARGET_LD_SHIM_LIBS := /vendor/lib64/libcutils.so|libatomic.so

#Fingerprint
#BOARD_SEPOLICY_DIRS += (DEVICE_PATH)/sepolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

MTK_INTERNAL_CDEFS := $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),$(foreach v,$(shell echo $($(t)) | tr '[a-z]' '[A-Z]'),-D$(v))))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)=\"$($(t))\"))

MTK_GLOBAL_CFLAGS += $(MTK_INTERNAL_CDEFS)
PRODUCT_COPY_FILES += device/homtom/F509/twrp.fstab:recovery/root/etc/twrp.fstab
ifneq ($(MTK_K64_SUPPORT), yes)
BOARD_KERNEL_CMDLINE = bootopt=64S3,32N2,32N2 androidboot.selinux=permissive
else
BOARD_KERNEL_CMDLINE = bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
endif
#A-GO
MALLOC_SVELTE := true
