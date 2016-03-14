# Implementation Status
This document shows the implementation status of Web Bluetooth on the
different browsers.

# Chrome
Work is in progress:
* Notes updated **2016-03-03**.
* Know [How to file Web Bluetooth Bugs](https://www.chromium.org/developers/how-tos/file-web-bluetooth-bugs).
* The `chrome://flags/#enable-web-bluetooth` flag must be enabled.
* Root [Issue 419413: Web Bluetooth](https://code.google.com/p/chromium/issues/detail?id=419413) and blocking issues are most authorative on status.

Feature                   | Chrome OS | Android M | Mac OS X | Linux | Windows 8.1
------------------------- | :-------: | :-------: | :------: | :----: | :-----:
Discovery                 | ✓         | ✓         | ✓        | 50     | 50 (paired devices only)
└ Name or prefix          | ✓         | ✓         | ✓        | 50     | 50
Chooser UI                | ✓         | ✓         | ✓        | 50     | 50
GATT Server Connect       | ✓         | ✓         |          | 50
Read Characteristic       | ✓         | ✓         |          | 50
Write Characteristic      | ✓         | ✓         |          | 50
Characteristic Properties | ✓         | ✓         |          | 50
GATT Notifications        | ✓         | (start only) |    | 50
GATT Server Disconnect    | 50        | 50        |          | 50
Get Characteristics List  | 50        | 50        |          | 50

### Notes

* Chrome OS has the most features working currently, as the low level libraries for Bluetooth GATT are already implemented.
* [Android](https://crbug.com/471536) under development.
 * Chrome builds requires Android 6, Marshmallow or later.
 * Tip of tree [Chromium builds](https://download-chromium.appspot.com/?platform=Android&type=snapshots) work on Android 5, Lollipop or later for ease of developers - but Chrome versions will only ever support Marshmallow or later. Read [how to play with Web Bluetooth on Lollipop](http://stackoverflow.com/q/34810194/422957).
 * [Android Chooser UI](https://crbug.com/436280) works but has some bugs.
* [Mac OS X](https://crbug.com/364359): Requires Mac OS X Yosemite. It is partially working, but not under active development. It's next on the list after ChromeOS and Android.
  * Some MacBook's may not work: Check "About this Mac" / "System Report" / "Bluetooth" and verify that Low Energy is supported.
* [Windows](https://crbug.com/507419): Discover only manually paired devices.
* [Linux](https://crbug.com/570344): Requires Kernel 3.19+ and BlueZ 5+ installed (by default in Ubuntu 15.10).
  * Note that Bluetooth daemon needs experimental interfaces feature enabled: `sudo /usr/sbin/bluetoothd -E`  
* Latest demo post: [Web Bluetooth experimental in Chrome on Android and Chrome OS](https://www.w3.org/community/web-bluetooth/2015/11/18/web-bluetooth-experimental-in-chrome-on-android-and-chrome-os/) 2015-11-18

## Hardware Compatibility List

### Working

Company | System Information | Bluetooth Manufacturer | Bluetooth Chipset
------- | ------------------ | ---------------------- | -----------------
Google  | Chromebook Pixel 2013 | Qualcomm Atheros, Inc. | AR5BMD22
Google  | Chromebook Pixel 2015 | Intel Inc. | Intel® Dual Band Wireless-AC 7260 
Dell    | Chromebook 15      | Intel Inc. | Intel® Dual Band Wireless-AC 7260
Toshiba | Chromebook 2 - 2015 Edition | Intel Inc. | Intel® Dual Band Wireless-AC 7260 
Acer    | Chromebook 15 | Intel Inc. | Intel® Dual Band Wireless-AC 7260
Asus    | Chromebook Flip <br/> 49| Broadcom | BCM4354
Apple   | MacBook Air (13-inch, Mid 2012) <br/> OS X 10.11 | Broadcom | 20702A3
Apple   | MacBook Air (13-inch, Early 2015) <br/> OS X 10.11 | Broadcom | 20702B0

## [Chrome Apps Polyfill](https://github.com/WebBluetoothCG/chrome-app-polyfill)
A polyfill for the Web Bluetooth API running inside a Chrome App.

Developers can embed the Polyfill into a Chrome App to get a feel of how the
Web Bluetooth API will work. Note: Only works on ChromeOS.

# Opera
Same as Chrome unless specificied otherwise

# Firefox
- https://bugzilla.mozilla.org/show_bug.cgi?id=1204396
- https://bugzilla.mozilla.org/buglist.cgi?quicksearch=%5Bweb-bluetooth%5D

# Microsoft Edge
https://dev.windows.com/en-us/microsoft-edge/platform/status/webbluetooth

# [Android BLE Peripheral App](https://github.com/WebBluetoothCG/ble-test-peripheral-android)

The Peripheral App simulates a BLE peripheral. Developers can connect to
the simulated BLE peripheral using the Web Bluetooth API to read and write
characteristics or subscribe to notifications from them.
