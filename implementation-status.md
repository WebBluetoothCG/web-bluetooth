# Implementation Status
This document shows the implementation status of Web Bluetooth on the
different browsers.

<a href="#chrome"><img width=64 src="https://raw.githubusercontent.com/alrra/browser-logos/master/src/chrome/chrome_128x128.png" alt="Chrome browser logo"></a><a href="#samsung-internet"><img width=64 src="https://raw.githubusercontent.com/alrra/browser-logos/master/src/samsung-internet/samsung-internet_128x128.png" alt="Samsung Internet browser logo"></a><a href="#opera"><img width=64 src="https://raw.githubusercontent.com/alrra/browser-logos/master/src/opera/opera_128x128.png" alt="Opera browser logo"></a><a href="#servo"><img width=64 src="https://raw.githubusercontent.com/alrra/browser-logos/master/src/servo/servo_128x128.png" alt="Servo browser logo"></a><a href="#firefox"><img width=64 src="https://raw.githubusercontent.com/alrra/browser-logos/master/src/firefox/firefox_128x128.png" alt="Firefox browser logo"></a><a href="#microsoft-edge"><img width=64 src="https://raw.githubusercontent.com/alrra/browser-logos/master/src/edge/edge_128x128.png" alt="Microsoft Edge browser logo"></a><a href="#safari"><img width=64 src="https://raw.githubusercontent.com/alrra/browser-logos/master/src/safari/safari_128x128.png" alt="Safari browser logo"></a>

# Chrome
Work is in progress:
* Know [How to file Web Bluetooth Bugs](https://www.chromium.org/developers/how-tos/file-web-bluetooth-bugs).
* In **Android, Chrome OS, Mac and Windows**, the GATT Communication API is shipped without any flag.
* **Linux** is partially implemented and not supported. The `chrome://flags/#enable-experimental-web-platform-features` flag must be enabled.
* The Windows implementation is available in Chrome 70.0.3526.0 and requires **Windows 10 version 1703 (Creators Update)**.
* Root [Issue 419413: Web Bluetooth](https://code.google.com/p/chromium/issues/detail?id=419413) and blocking issues are most authorative on status.
* Some Bluetooth GATT operations can't be run in parallel yet. See [#188 (comment)](https://github.com/WebBluetoothCG/web-bluetooth/issues/188#issuecomment-255121220)

## [GATT Communication API](https://webbluetoothcg.github.io/web-bluetooth/)

Feature/Platform          | Chrome OS | Android | Mac | Linux | Windows |
------------------------- | :-------: | :-----: | :-: | :---: | :-----: |
getAvailability()         |           |         |     |       |         |
Referring Device (Physical Web) |     |         |     |       |         |
Discovery                 | ✓         | ✓       | ✓   | ✓     | ✓       |
└ Service list            | ✓         | ✓       | ✓   | ✓     | ✓       |
└ Name or prefix          | ✓         | ✓       | ✓   | ✓     | ✓       |
└ Manufacturer/Service data |         |         |     |       |         |
└ acceptAllDevices        | ✓         | ✓       | ✓   | ✓     | ✓      |
Chooser UI                | ✓         | ✓       | ✓   | ✓     | ✓       |
permissions.request()     |           |         |     |       |         |
permissions.query()       |           |         |     |       |         |
permissions.revoke()      |           |         |     |       |         |
watchAdvertisements()     |           |         |     |       |         |
Persistent Device IDs     |           |         |     |       |         |
GATT Server Connect       | ✓         | ✓       | ✓   | ✓     | ✓       |
GATT Server Disconnect    | ✓         | ✓       | ✓   | ✓     | ✓       |
Hanging connect() abortable by disconnect() |  | |    |       |         |
getPrimaryService*()      | ✓         | ✓       | ✓   | ✓     | ✓       |
getIncludedService*()     |           |         |     |       |         |
getCharacteristic*()      | ✓         | ✓       | ✓   | ✓     | ✓       |
Characteristic Properties | ✓         | ✓       | ✓   | ✓     | 70       |
Read Characteristic       | ✓         | ✓       | ✓   | ✓     | ✓       |
Write Characteristic      | ✓         | ✓       | ✓   | ✓     | ✓       |
└ With Response           | 85        | 85      | 85  | 85    | 85      |
└ Without Response        | 85        | 85      | 85  | 85    | 85      |
Start/Stop Notifications  | ✓         | ✓       | ✓   | ✓     | 70      |
Descriptors               | ✓         | ✓       | ✓   | ✓     | 70      |
Event bubbling            |           |         |     |       |         |
Device Disconnected Event | ✓         | ✓       | ✓   | ✓     | 70      |
Service Changed Event     |           |         |     |       |         |
BluetoothUUID             | ✓         | ✓       | ✓   | ✓     | ✓       |
TypeError for bad UUIDs   | ✓         | ✓       | ✓   | ✓     | ✓       |
Invalidate GATT attributes upon disconnect | ✓ | ✓   | ✓   | ✓     | ✓     |
GATT Blocklist            | ✓         | ✓       | ✓   | ✓     | ✓       |
Low-latency Blocklist Updates | ✓     | ✓       | ✓   | ✓     | ✓       |

## [Scanning API](https://webbluetoothcg.github.io/web-bluetooth/scanning.html)

Partial development.  `chrome://flags/#enable-experimental-web-platform-features` 🚩 flag required.

Feature/Platform          | Chrome OS | Android | Mac | Linux | Windows |
------------------------- | :-------: | :-----: | :-: | :---: | :-----: |
Advertisements Scanning   |           | 🚩      | 🚩  |       |         |

[Implementation issue](https://crbug.com/897312)

Tip: Chrome channel releases are tracked at [https://googlechromelabs.github.io/current-versions/](https://googlechromelabs.github.io/current-versions/).

### Notes

* [Android](https://crbug.com/471536): Requires Android 6.0 Marshmallow or later.
* [Mac](https://crbug.com/364359): Requires OS X Yosemite or later.
  * Some MacBooks may not work: Check "About this Mac" / "System Report" / "Bluetooth" and verify that Low Energy is supported.
* [Linux](https://crbug.com/570344): Requires Kernel 3.19+ and [BlueZ](http://www.bluez.org/) 5.41+ installed. Read [How to get Chrome Web Bluetooth working on Linux](https://acassis.wordpress.com/2016/06/28/how-to-get-chrome-web-bluetooth-working-on-linux/).
  * Note that Bluetooth daemon needs to run with experimental interfaces if BlueZ version is lower than 5.43: `sudo /usr/sbin/bluetoothd -E`
* [Windows](https://crbug.com/507419): Requires Windows 10 version 1706 (Creators Update) or later.

### Unsupported platforms

* Android WebView: Will be supported in the future.
* iOS: Uses the web exposed APIs as provided by the [WKWebView](https://developer.apple.com/library/ios/documentation/WebKit/Reference/WKWebView_Ref/), no implementation planned in the Chromium codebase.

Note: [WebBLE](https://itunes.apple.com/us/app/webble/id1193531073) is an app for iOS that supports the GATT Communication API. It was created initially for the [Puck.js project](https://www.espruino.com/Puck.js+Quick+Start#ios-iphone-ipad-).

# Samsung Internet
In Samsung Internet v6.4, the GATT Communication API is shipped without any flag.

- https://medium.com/samsung-internet-dev/lets-connect-with-samsung-internet-v6-4-stable-1f197d43a812
- https://samsunginter.net/docs/web-bluetooth

# Opera
Available behind a flag `opera://flags/#enable-web-bluetooth`.

# Servo
https://szeged.github.io/servo/

# Firefox
- https://bugzilla.mozilla.org/show_bug.cgi?id=1204396
- https://bugzilla.mozilla.org/buglist.cgi?quicksearch=%5Bweb-bluetooth%5D

# Microsoft Edge
https://dev.windows.com/en-us/microsoft-edge/platform/status/webbluetooth

# Safari
https://bugs.webkit.org/show_bug.cgi?id=101034

# Node.js
Node.js ports are available:
- https://github.com/thegecko/webbluetooth
- https://github.com/IjzerenHein/node-web-bluetooth
