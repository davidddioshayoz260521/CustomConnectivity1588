# ConnectivityCustomizer15

Rootless Dopamine project for iPhone 7 / iOS 15.8.8.

Target controls:
1. Airplane Mode
2. Cellular Data
3. Wi-Fi
4. Bluetooth
5. AirDrop
6. Personal Hotspot

## Build
make clean package FINALPACKAGE=1 THEOS_PACKAGE_SCHEME=rootless

The current source is a safe discovery scaffold, not a claimed finished
private-API hook. The exact private class/selector ABI must be confirmed on
iOS 15.8.8 before implementing hide/show, otherwise the tweak could simply
do nothing or destabilize SpringBoard.
