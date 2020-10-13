LOCAL_PATH := $(call my-dir)

ifneq ($(filter x1s,$(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
