LOCAL_PATH := $(call my-dir)

ifneq ($(filter mangov1 mangov2 shadow rhino jackson sunrice,$(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
