MKDTIMG := $(HOST_OUT_EXECUTABLES)/mkdtimg$(HOST_EXECUTABLE_SUFFIX)

KERNEL_DTBO_DIR := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/arch/arm64/boot/dts/$(TARGET_DEVICE)
KERNEL_DTBO_CFG := $(COMMON_PATH)/configs/$(TARGET_DEVICE)_dtboimg.cfg

define build-dtboimage-target
    $(call pretty,"Target dtbo image: $(BOARD_PREBUILT_DTBOIMAGE)")
    $(MKDTIMG) cfg_create $@ $(KERNEL_DTBO_CFG) -d $(KERNEL_DTBO_DIR)
    $(hide) chmod a+r $@
endef

$(BOARD_PREBUILT_DTBOIMAGE): $(MKDTIMG) $(INSTALLED_KERNEL_TARGET)
	$(build-dtboimage-target)

