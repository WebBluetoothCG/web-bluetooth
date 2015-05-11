# Implementation Status
This document shows the implementation status of Web Bluetooth on the
different browsers.

To try out the Web Bluetooth API developers can use the [Android BLE Peripheral
App](https://github.com/WebBluetoothCG/ble-test-peripheral-android). The
Peripheral App simulates a BLE peripheral. Developers can connect to
the simulated BLE peripheral using the Web Bluetooth API to read and write
characteristics or subscribe to notifications from them.

# Chrome
Currently working on the implementation under the
chrome://flags/#enable-experimental-web-platform-features flag.

## [Chrome Apps Polyfill](https://github.com/WebBluetoothCG/chrome-app-polyfill)
A polyfill for the Web Bluetooth API running inside a Chrome App.

Developers can embed the Polyfill into a Chrome App to get a feel of how the
Web Bluetooth API will work. Note: Only works on ChromeOS.
