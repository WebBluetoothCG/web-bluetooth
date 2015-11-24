# Implementation Status
This document shows the implementation status of Web Bluetooth on the
different browsers.

# Chrome
Work is in progress:
* Notes updated **2015-11-16**.
* Know [How to file Web Bluetooth Bugs](https://www.chromium.org/developers/how-tos/file-web-bluetooth-bugs).
* The `chrome://flags/#enable-web-bluetooth` flag must be enabled.
* Root [Issue 419413: Web Bluetooth](https://code.google.com/p/chromium/issues/detail?id=419413) and blocking issues are most authorative on status.
* __ChromeOS__ has the most features working currently, as the low level libraries for Bluetooth GATT are already implemented.
 * Chrome 45: Connect to device with filters, no UI, Read and Write Characteristics.
 * Chrome 48: Characteristic notifications and properties
* [Android](https://code.google.com/p/chromium/issues/detail?id=471536) under development.
 * Chrome 48: Up to `getCharacteristic` then read and write values. Notifications can be enabled, but don't yet generate `characteristicvaluechanged` events. 
  * Chrome builds requires Android 6, Marshmallow or later.
  * Tip of tree [Chromium builds](https://download-chromium.appspot.com/) work on Android 5, Lollipop or later for ease of developers - but Chrome versions will only ever support Marshmallow or later.
 * [Android Chooser UI](https://code.google.com/p/chromium/issues/detail?id=436280) works but has some bugs.
* [Mac OSX](https://code.google.com/p/chromium/issues/detail?id=364359) is partially working, but not under active development. It's next on the list after ChromeOS and Android.
 * Can discover devices and report basic information (e.g. name) (Chrome 46)
 * Many MacBook's may not work:
    1. Check "About this Mac"
    2. "System Report"
    3. "Bluetooth"
    4. Verify that Low Energy is supported.
    5. Check the Chipset:
      * Chipset: 20702B0 <<< Works
      * Chipset: 20702A3 <<< Doesn't work
* Windows will come later. Linux support depends on whether we can find people to maintain the drivers.
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

### Non-Working

Company | System Information | Bluetooth Manufacturer | Bluetooth Chipset
------- | ------------------ | ---------------------- | -----------------
Apple | MacBook Air (13-inch, Mid 2012) | Broadcom | 20702A3

## [Chrome Apps Polyfill](https://github.com/WebBluetoothCG/chrome-app-polyfill)
A polyfill for the Web Bluetooth API running inside a Chrome App.

Developers can embed the Polyfill into a Chrome App to get a feel of how the
Web Bluetooth API will work. Note: Only works on ChromeOS.

# [Android BLE Peripheral App](https://github.com/WebBluetoothCG/ble-test-peripheral-android)

The Peripheral App simulates a BLE peripheral. Developers can connect to
the simulated BLE peripheral using the Web Bluetooth API to read and write
characteristics or subscribe to notifications from them.
