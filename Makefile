ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
	TARGET := iphone:clang:latest:15.0
else
	TARGET := iphone:clang:latest:12.2
endif


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SunsetTweak

SunsetTweak_FILES = $(shell find Sources/VendettaTweak -name '*.swift') $(shell find Sources/VendettaTweakC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
SunsetTweak_SWIFTFLAGS = -ISources/VendettaTweakC/include
SunsetTweak_CFLAGS = -fobjc-arc -ISources/VendettaTweakC/include

SunsetTweak_BUNDLE_NAME = SunsetPatches
SunsetTweak_BUNDLE_RESOURCE_DIRS = SunsetXposed/App/src/main/assets/js Resources

include $(THEOS_MAKE_PATH)/tweak.mk
