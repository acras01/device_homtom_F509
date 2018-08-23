

######################################################

# PRODUCT_COPY_FILES overwrite
# Please add flavor project's PRODUCT_COPY_FILES here.
# It will overwrite base project's PRODUCT_COPY_FILES.

# overlay has priorities. high <-> low.
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

#######################################################


# PRODUCT_COPY_FILES += $(LOCAL_PATH)/egl.cfg:$(TARGET_COPY_OUT_VENDOR)/lib/egl/egl.cfg:mtk
# PRODUCT_COPY_FILES += $(LOCAL_PATH)/ueventd.mt6735.rc:root/ueventd.mt6735.rc

PRODUCT_COPY_FILES += $(LOCAL_PATH)/factory_init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/factory_init.project.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.project.rc
PRODUCT_COPY_FILES += $(LOCAL_PATH)/meta_init.project.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/meta_init.project.rc

ifeq ($(MTK_SMARTBOOK_SUPPORT),yes)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/sbk-kpd.kl:system/usr/keylayout/sbk-kpd.kl:mtk \
                      $(LOCAL_PATH)/sbk-kpd.kcm:system/usr/keychars/sbk-kpd.kcm:mtk
endif

# Add FlashTool needed files
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/EBR1:EBR1
#ifneq ($(wildcard $(LOCAL_PATH)/EBR2),)
#  PRODUCT_COPY_FILES += $(LOCAL_PATH)/EBR2:EBR2
#endif
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/MBR:MBR
#PRODUCT_COPY_FILES += $(LOCAL_PATH)/MT6737M_Android_scatter.txt:MT6737M_Android_scatter.txt


# thermal.conf and thermal_eng.conf:with BCCT 
# thermal_NoBCCT.conf and thermal_eng_NoBCCT.conf:no BCCT 
# thermal policy no BCCT
ifeq ($(TARGET_BUILD_VARIANT),eng)
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal_eng.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/thermal.conf:mtk
else
    PRODUCT_COPY_FILES += $(LOCAL_PATH)/thermal.conf:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/thermal.conf:mtk
endif
PRODUCT_COPY_FILES += $(LOCAL_PATH)/ht120.mtc:$(TARGET_COPY_OUT_VENDOR)/etc/.tp/.ht120.mtc:mtk

# libatomic
PRODUCT_PACKAGES += libatomic

# alps/vendor/mediatek/proprietary/external/GeoCoding/Android.mk

# alps/vendor/mediatek/proprietary/frameworks-ext/native/etc/Android.mk

# touch related file for CTS
ifeq ($(strip $(CUSTOM_KERNEL_TOUCHPANEL)),generic)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml
else
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml
endif

# USB OTG
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml

# GPS relative file
ifeq ($(MTK_GPS_SUPPORT),yes)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml
endif

# alps/external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/Android.mk
# PRODUCT_COPY_FILES += external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/driver/open_nfc_driver.ko:$(TARGET_COPY_OUT_VENDOR)/lib/open_nfc_driver.ko:mtk

# alps/frameworks/av/media/libeffects/factory/Android.mk
PRODUCT_COPY_FILES += frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf

# alps/mediatek/config/$project
PRODUCT_COPY_FILES += $(LOCAL_PATH)/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml



# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.service.acm.enable=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.mount.fs=EXT4

#PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapgrowthlimit=256m
#PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapsize=512m

# meta tool
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.chip_ver=S01
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.platform=MT6737M

# set Telephony property - SIM count
SIM_COUNT := 2
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.sim.count=$(SIM_COUNT)
PRODUCT_PROPERTY_OVERRIDES += persist.radio.default.sim=0

# Audio Related Resource
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/F509/factory/res/sound/testpattern1.wav:$(TARGET_COPY_OUT_VENDOR)/res/sound/testpattern1.wav:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/F509/factory/res/sound/ringtone.wav:$(TARGET_COPY_OUT_VENDOR)/res/sound/ringtone.wav:mtk

# Keyboard layout
PRODUCT_COPY_FILES += device/mediatek/mt6735/ACCDET.kl:system/usr/keylayout/ACCDET.kl:mtk
PRODUCT_COPY_FILES += $(LOCAL_PATH)/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl:mtk

# Microphone
PRODUCT_COPY_FILES += $(LOCAL_PATH)/android.hardware.microphone.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.microphone.xml

# Camera
PRODUCT_COPY_FILES += $(LOCAL_PATH)/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml

# Audio Policy
PRODUCT_COPY_FILES += $(LOCAL_PATH)/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf:mtk

#Images for LCD test in factory mode
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/F509/factory/res/images/lcd_test_00.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_00.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/F509/factory/res/images/lcd_test_01.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_01.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/F509/factory/res/images/lcd_test_02.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_02.png:mtk

#For GMO to reduce runtime memroy usage
ifeq (yes,$(strip $(MTK_GMO_RAM_OPTIMIZE)))

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.hwui.path_cache_size=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.hwui.text_small_cache_width=512
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.hwui.text_small_cache_height=256
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.hwui.disable_asset_atlas=true


# Disable fast starting window in GMO project
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.mtk_perf_fast_start_win=0


#Images for LCD test in factory mode
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/common/factory/res/images/lcd_test_00_gmo.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_00.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/common/factory/res/images/lcd_test_01_gmo.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_01.png:mtk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/common/factory/res/images/lcd_test_02_gmo.png:$(TARGET_COPY_OUT_VENDOR)/res/images/lcd_test_02.png:mtk

PRODUCT_COPY_FILES += device/mediatek/common/fstab.enableswap_ago:root/fstab.enableswap

#end of For GMO to reduce runtime memroy usage
endif

#media_codecs.xml for video codec support
PRODUCT_COPY_FILES += $(LOCAL_PATH)/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml:mtk
PRODUCT_COPY_FILES += $(LOCAL_PATH)/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml:mtk
PRODUCT_COPY_FILES += $(LOCAL_PATH)/media_codecs_mediatek_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_audio.xml:mtk
PRODUCT_COPY_FILES += $(LOCAL_PATH)/media_codecs_mediatek_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_video.xml:mtk
PRODUCT_COPY_FILES += $(LOCAL_PATH)/mtk_omx_core.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/mtk_omx_core.cfg:mtk
PRODUCT_COPY_FILES += frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml
PRODUCT_COPY_FILES += frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

ifeq ($(strip $(MTK_FINGERPRINT_SUPPORT)), yes) 
    PRODUCT_COPY_FILES +=frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml
PRODUCT_PACKAGES += android.hardware.biometrics.fingerprint@2.0-service-custom
#PRODUCT_PACKAGES += android.hardware.biometrics.fingerprint@2.1
#PRODUCT_PACKAGES += android.hardware.biometrics.fingerprint@2.1-service
#PRODUCT_COPY_FILES += device/homtom/F509/goodix/bin/fingerprintd:system/bin/fingerprintd
PRODUCT_COPY_FILES += device/homtom/F509/goodix/bin/gx_fpd:$(TARGET_COPY_OUT_VENDOR)/bin/gx_fpd
PRODUCT_COPY_FILES += device/homtom/F509/goodix/etc/init/gx_fpd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/gx_fpd.rc
PRODUCT_COPY_FILES += device/homtom/F509/goodix/bin/gx_fpd_fix.sh:$(TARGET_COPY_OUT_VENDOR)/bin/gx_fpd_fix.sh
PRODUCT_COPY_FILES += device/homtom/F509/goodix/bin/gx_fpcmd:$(TARGET_COPY_OUT_VENDOR)/bin/gx_fpcmd
PRODUCT_COPY_FILES += device/homtom/F509/goodix/lib64/libfp_client.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libfp_client.so
PRODUCT_COPY_FILES += device/homtom/F509/goodix/lib64/libalgoandroid.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libalgoandroid.so
PRODUCT_COPY_FILES += device/homtom/F509/goodix/lib64/libfpservice.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libfpservice.so
PRODUCT_COPY_FILES += device/homtom/F509/goodix/lib64/libfprint-x64.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libfprint-x64.so
#PRODUCT_COPY_FILES += device/homtom/F509/goodix/lib64/hw/fingerprint.goodix.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/fingerprint.goodix.so
#PRODUCT_COPY_FILES += device/homtom/F509/goodix/lib64/hw/fingerprint.default.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/fingerprint.default.so
PRODUCT_COPY_FILES += device/homtom/F509/goodix/lib64/hw/fingerprint.goodix.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/fingerprint.default.so
#PRODUCT_COPY_FILES += device/homtom/F509/goodix/lib64/hw/fingerprint.microarray.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/fingerprint.microarray.so
#PRODUCT_COPY_FILES += device/homtom/F509/goodix/lib64/hw/gxfingerprint.default.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/gxfingerprint.default.so
PRODUCT_COPY_FILES += device/homtom/F509/goodix/lib64/hw/gxfingerprint.default_patched.so:$(TARGET_COPY_OUT_VENDOR)/lib64/hw/gxfingerprint.default.so
endif

#Fingerprint(Goodix) Begin
#ifeq (yes, $(strip $(MTK_FINGERPRINT_SUPPORT)))
#  ifeq ($(strip $(MTK_FINGERPRINT_SELECT)), $(filter $(MTK_FINGERPRINT_SELECT), GF316M GF318M GF3118M GF518M GF5118M GF516M GF816M GF3208 GF3206 GF3266 GF3288 GF5206 GF5216 GF5208))
#    PRODUCT_PACKAGES += \
#    libgf_ca \
#    libgf_algo \
#    libgf_hal \
#    libgoodixfingerprintd_binder \
#    goodixfingerprintd \
#    fingerprint.mt6737m \
#    fingerprintd

# only for fingerprint factory test
#    PRODUCT_PACKAGES += \
#    libgf_hal_factory \
#    libgf_hal_ree \
#    libgf_ca_ree \
#    libgf_ta_ree

#    PRODUCT_COPY_FILES += \
#    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml
#  endif
#endif
#Fingerprint(Goodix) End

# overlay has priorities. high <-> low.

DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/sd_in_ex_otg

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
ifdef OPTR_SPEC_SEG_DEF
  ifneq ($(strip $(OPTR_SPEC_SEG_DEF)),NONE)
    OPTR := $(word 1,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SPEC := $(word 2,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SEG  := $(word 3,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/operator/$(OPTR)/$(SPEC)/$(SEG)
  endif
endif
ifneq (yes,$(strip $(MTK_TABLET_PLATFORM)))
  ifeq (480,$(strip $(LCM_WIDTH)))
    ifeq (854,$(strip $(LCM_HEIGHT)))
      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/FWVGA
    endif
  endif
  ifeq (540,$(strip $(LCM_WIDTH)))
    ifeq (960,$(strip $(LCM_HEIGHT)))
      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/qHD
    endif
  endif
endif
ifeq (yes,$(strip $(MTK_GMO_ROM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_rom
endif
ifeq (yes,$(strip $(MTK_GMO_RAM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/slim_ram
endif
DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/navbar

ifeq ($(strip $(OPTR_SPEC_SEG_DEF)),NONE)
    PRODUCT_PACKAGES += DangerDash
endif

# media_profiles.xml for media profile support
PRODUCT_COPY_FILES += device/mediatek/mt6735/media_profiles_mt6735m.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml:mtk
PRODUCT_PROPERTY_OVERRIDES += media.settings.xml=/vendor/etc/media_profiles.xml

$(call inherit-product, device/mediatek/mt6735/device.mk)

$(call inherit-product-if-exists, vendor/mediatek/libs/$(MTK_TARGET_PROJECT)/device-vendor.mk)
# A-GO
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

include vendor/homtom/prebuilds.mk
