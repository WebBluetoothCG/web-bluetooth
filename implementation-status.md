# Implementation Status
This document shows the implementation status of Web Bluetooth on the
different browsers.

# Chrome
Work is in progress:
* Notes updated 2015-07-15.
* Root [Issue 419413: Web Bluetooth](https://code.google.com/p/chromium/issues/detail?id=419413) and blocking issues are most authorative on status.
* [API Implementation](https://code.google.com/p/chromium/issues/detail?id=420275) now supports the basics:
 * Connect to a device, filtering by service UUIDs.
 * Get a Service and then Characteristic.
 * Read and Write values to Characteristic
* __ChromeOS__ has the most features working currently, as the low level libraries for Bluetooth GATT are already implemented.
 * Chrome 45: Connect to device with filters, no UI, Read and Write Characteristics.
* [Android](https://code.google.com/p/chromium/issues/detail?id=471536) under development.
 * Tip of tree can connect to devices and read basic information. 
 * [Android Chooser UI](https://code.google.com/p/chromium/issues/detail?id=498016) is under development.
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
* The `chrome://flags/#enable-web-bluetooth` flag must be enabled.
* Latest demo post: [Discovering devices on ChromeOS](https://www.w3.org/community/web-bluetooth/2015/01/07/first-chromium-demo/)

## Hardware Compatibility List

### Working

Company | System Information | Bluetooth Manufacturer | Bluetooth Chipset
------- | ------------------ | ---------------------- | -----------------
Google | Chromebook Pixel 2013 | Qualcomm Atheros, Inc. | AR5BMD22

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
