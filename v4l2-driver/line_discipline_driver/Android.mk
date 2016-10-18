LOCAL_PATH := $(call my-dir)

DLKM_DIR := $(TOP)/device/qcom/common/dlkm

KBUILD_OPTIONS := MODNAME=brcm_hci_ldisc
KBUILD_OPTIONS += BOARD_PLATFORM=$(TARGET_BOARD_PLATFORM)

ifneq (,$(filter $(SEMC_PLATFORM), shinano))
KBUILD_EXTRA_SYMBOLS := KERNEL_OBJ/Module.symvers
KBUILD_OPTIONS += CONFIG_SOMC_SHINANO_LPM=TRUE
endif

include $(CLEAR_VARS)
LOCAL_MODULE := brcm_hci_ldisc.ko
LOCAL_MODLUE_KBUILD_NAME := brcm_hci_ldisc.ko
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT)/lib/modules
include $(DLKM_DIR)/AndroidKernelModule.mk

TARGET_LDISC := $(KBUILD_TARGET)
