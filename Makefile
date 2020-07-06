INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CantReachMe

CantReachMe_FILES = Tweak.x
CantReachMe_CFLAGS = -fobjc-arc
ARCHS = arm64 arm64e
include $(THEOS_MAKE_PATH)/tweak.mk
