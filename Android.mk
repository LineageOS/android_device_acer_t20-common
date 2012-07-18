ifneq ($(filter $(TARGET_BOOTLOADER_BOARD_NAME),picasso picasso_e vangogh),)

include $(all-subdir-makefiles)

include $(CLEAR_VARS)

# generate init.<board>.rc
LOCAL_INITRC_FILES := device/acer/t20-common/prebuilt/ramdisk/init.t20.rc

ifneq ($(filter $(CM_BUILD),a100 a200 a500),)
    LOCAL_INITRC_FILES += device/acer/t20-common/prebuilt/ramdisk/bcm.gps.rc
endif

TARGET_INIT_FILE := $(TARGET_ROOT_OUT)/init.$(TARGET_BOOTLOADER_BOARD_NAME).rc

$(TARGET_INIT_FILE): $(LOCAL_INITRC_FILES)
	$(hide) echo "import init.$(TARGET_BOOTLOADER_BOARD_NAME).usb.rc" > $@
	$(hide) cat $^ >> $@

ALL_GENERATED_SOURCES += $(TARGET_INIT_FILE)

endif
