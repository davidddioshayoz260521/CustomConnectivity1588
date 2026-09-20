export THEOS_PACKAGE_SCHEME = rootless
ARCHS = arm64
TARGET = iphone:clang:latest:15.0
include $(THEOS)/makefiles/common.mk
TWEAK_NAME = ConnectivityCustomizer15
ConnectivityCustomizer15_FILES = Sources/Tweak.xm
ConnectivityCustomizer15_CFLAGS = -fobjc-arc
ConnectivityCustomizer15_FRAMEWORKS = UIKit Foundation
ConnectivityCustomizer15_LIBRARIES = substrate
include $(THEOS_MAKE_PATH)/tweak.mk
after-install::
	install.exec "killall -9 SpringBoard"
