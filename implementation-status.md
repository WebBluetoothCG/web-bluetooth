# Implementation Status
This document shows the implementation status of Web Bluetooth on the
different browsers.

# Chrome
Work is in progress:
* Notes updated **2016-07-21**.
* Know [How to file Web Bluetooth Bugs](https://www.chromium.org/developers/how-tos/file-web-bluetooth-bugs).
* The `chrome://flags/#enable-web-bluetooth` flag must be enabled.
* Root [Issue 419413: Web Bluetooth](https://code.google.com/p/chromium/issues/detail?id=419413) and blocking issues are most authorative on status.

Feature/Platform          | Chrome OS | Android | macOS | Linux | Windows | iOS
------------------------- | :-------: | :-----: | :---: | :---: | :-----: | :-:
Discovery                 | ✓         | ✓       | ✓     | ✓     | ✓       | See notes
└ Name or prefix          | ✓         | ✓       | ✓     | ✓     | ✓       |
Chooser UI                | ✓         | ✓       | ✓     | ✓     | ✓       |
GATT Server Connect       | ✓         | ✓       | ✓     | ✓     |         |
Read Characteristic       | ✓         | ✓       | 53    | ✓ |
Write Characteristic      | ✓         | ✓       | 53    | ✓ |
Characteristic Properties | ✓         | ✓       | 53    | ✓     |         |
GATT Notifications        | ✓         | &nbsp;&nbsp;✓&nbsp;&nbsp;&nbsp;start <br/> :construction_worker: stop|  53 start  | ✓ |
GATT Server Disconnect    | ✓         | ✓       | ✓     | ✓     |         |
Get Characteristics List  | ✓         | ✓       | 53    | ✓     |         |
Device Disconnected Event | 52        | 52      | ✓     | ✓     |         |
Get Primary Services List | 53        | 53      | 53    | 53    |         |

Tip: Chrome channel releases are tracked at [https://googlechrome.github.io/current-versions/](https://googlechrome.github.io/current-versions/).

### Notes

* [Android](https://crbug.com/471536): Requires Android 6, Marshmallow or later.
 * Tip of tree [Chromium builds](https://download-chromium.appspot.com/?platform=Android&type=snapshots) work on Android 5, Lollipop and later for ease of developers - but Chrome versions will only ever support Marshmallow or later. Read [how to play with Web Bluetooth on Lollipop](http://stackoverflow.com/q/34810194/422957).
 * [Android Chooser UI](https://crbug.com/436280) works but has some bugs.
* [macOS](https://crbug.com/364359): Requires OS X Yosemite or later.
  * Some MacBooks may not work: Check "About this Mac" / "System Report" / "Bluetooth" and verify that Low Energy is supported.
* [Linux](https://crbug.com/570344): Requires Kernel 3.19+ and [BlueZ](http://www.bluez.org/) 5.41+ installed. Read [How to get Chrome Web Bluetooth working on Linux](https://acassis.wordpress.com/2016/06/28/how-to-get-chrome-web-bluetooth-working-on-linux/).
  * Note that Bluetooth daemon needs to run with experimental interfaces: `sudo /usr/sbin/bluetoothd -E`
* [Windows](https://crbug.com/507419): Requires Windows 8.1.
  * Discover only manually paired devices.
* iOS: Uses the web exposed APIs as provided by the [WKWebView](https://developer.apple.com/library/ios/documentation/WebKit/Reference/WKWebView_Ref/), no implementation planned in the Chromium codebase.

## [Chrome Apps Polyfill](https://github.com/WebBluetoothCG/chrome-app-polyfill)
A polyfill for the Web Bluetooth API running inside a Chrome App.

Developers can embed the Polyfill into a Chrome App to get a feel of how the
Web Bluetooth API will work. Note: Only works on ChromeOS.

# Opera
Same as Chrome unless specificied otherwise

# Firefox
- https://bugzilla.mozilla.org/show_bug.cgi?id=1204396
- https://bugzilla.mozilla.org/buglist.cgi?quicksearch=%5Bweb-bluetooth%5D

# Servo
https://szeged.github.io/servo/
 
# Microsoft Edge
https://dev.windows.com/en-us/microsoft-edge/platform/status/webbluetooth

# [Android BLE Peripheral App](https://github.com/WebBluetoothCG/ble-test-peripheral-android)

The Peripheral App simulates a BLE peripheral. Developers can connect to
the simulated BLE peripheral using the Web Bluetooth API to read and write
characteristics or subscribe to notifications from them.
