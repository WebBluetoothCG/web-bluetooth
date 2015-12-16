# Implementation Status
This document shows the implementation status of Web Bluetooth on the
different browsers.

# Chrome
Work is in progress:
* Notes updated **2015-12-15**.
* Know [How to file Web Bluetooth Bugs](https://www.chromium.org/developers/how-tos/file-web-bluetooth-bugs).
* The `chrome://flags/#enable-web-bluetooth` flag must be enabled.
* Root [Issue 419413: Web Bluetooth](https://code.google.com/p/chromium/issues/detail?id=419413) and blocking issues are most authorative on status.

Feature                   | Chrome OS | Chrome for Android M | Chrome for Mac OS X
------------------------- | :-------: | :------------------: | :-----------------:
Discovery                 | 45        | 48                   | 46
Chooser UI                |           | 48                   |
Read Characteristic       | 45        | 48                   |
Write Characteristic      | 45        | 48                   |
Characteristic Properties | 48        | 48                   |
GATT Notifications        | 48        |                      |

### Notes

* Chrome OS has the most features working currently, as the low level libraries for Bluetooth GATT are already implemented.
* [Android](https://crbug.com/471536) under development.
 * Chrome 48: Notifications can be enabled, but don't yet generate `characteristicvaluechanged` events. 
  * Chrome builds requires Android 6, Marshmallow or later.
  * Tip of tree [Chromium builds](https://download-chromium.appspot.com/?platform=Android&type=snapshots) work on Android 5, Lollipop or later for ease of developers - but Chrome versions will only ever support Marshmallow or later.
 * [Android Chooser UI](https://crbug.com/436280) works but has some bugs.
* [Mac OS X](https://crbug.com/364359) is partially working, but not under active development. It's next on the list after ChromeOS and Android.
 * Some MacBook's may not work:
  1. Check "About this Mac"
  2. "System Report"
  3. "Bluetooth"
  4. Verify that Low Energy is supported.
* Windows: Not started.
* Linux: Not started.
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
Apple   | MacBook Air (13-inch, Mid 2012) <br/> OS X 10.11 | Broadcom | 20702A3
Apple   | MacBook Air (13-inch, Early 2015) <br/> OS X 10.11 | Broadcom | 20702B0

### Non-Working

Company | System Information | Bluetooth Manufacturer | Bluetooth Chipset
------- | ------------------ | ---------------------- | -----------------
Apple   | MacBook Air (13-inch, Mid 2012) <br/> OS X 10.10 | Broadcom | 20702A3

## [Chrome Apps Polyfill](https://github.com/WebBluetoothCG/chrome-app-polyfill)
A polyfill for the Web Bluetooth API running inside a Chrome App.

Developers can embed the Polyfill into a Chrome App to get a feel of how the
Web Bluetooth API will work. Note: Only works on ChromeOS.

# Firefox
https://bugzilla.mozilla.org/show_bug.cgi?id=1204396

# Microsoft Edge
https://dev.windows.com/en-us/microsoft-edge/platform/status/webbluetooth

# [Android BLE Peripheral App](https://github.com/WebBluetoothCG/ble-test-peripheral-android)

The Peripheral App simulates a BLE peripheral. Developers can connect to
the simulated BLE peripheral using the Web Bluetooth API to read and write
characteristics or subscribe to notifications from them.
