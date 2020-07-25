ARCHS = arm64 arm64e
TARGET := iphone:clang:13.6:13.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CantReachMe
CantReachMe_FILES = Tweak.x $(wildcard WDFReachabilityStrategy/*.xm) $(wildcard CantReachMe/*.xm)
CantReachMe_CFLAGS = -fobjc-arc

SUBPROJECTS += prefs

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

