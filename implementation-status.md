# Implementation Status
This document shows the implementation status of Web Bluetooth on the
different browsers.

<a href="#chrome"><img width=128 src="https://raw.githubusercontent.com/alrra/browser-logos/master/chrome/chrome_256x256.png" alt="Chrome browser logo"></a><a href="#opera"><img width=128 src="https://raw.githubusercontent.com/alrra/browser-logos/master/opera/opera_256x256.png" alt="Opera browser logo"></a><a href="#servo"><img width=128 src="https://raw.githubusercontent.com/alrra/browser-logos/master/browser.html/browser.html_256x256.png" alt="Servo browser logo"></a><a href="#firefox"><img width=128 src="https://raw.githubusercontent.com/alrra/browser-logos/master/firefox/firefox_256x256.png" alt="Firefox browser logo"></a><a href="#microsoft-edge"><img width=128 src="https://raw.githubusercontent.com/alrra/browser-logos/master/edge/edge_256x256.png" alt="Microsoft Edge browser logo"></a><a href="#microsoft-edge"><img width=128 src="https://raw.githubusercontent.com/alrra/browser-logos/master/safari/safari_256x256.png" alt="Safari browser logo"></a>

# Chrome
Work is in progress:
* Notes updated **2016-07-21**.
* Know [How to file Web Bluetooth Bugs](https://www.chromium.org/developers/how-tos/file-web-bluetooth-bugs).
* The `chrome://flags/#enable-web-bluetooth` flag must be enabled, or the web page must have an [origin trial meta tag or header](https://github.com/jpchase/OriginTrials/blob/gh-pages/developer-guide.md) with a token requested from [http://bit.ly/WebBluetoothOriginTrial]().
* Root [Issue 419413: Web Bluetooth](https://code.google.com/p/chromium/issues/detail?id=419413) and blocking issues are most authorative on status.

Feature/Platform          | Chrome OS | Android | Mac | Linux | Windows | iOS
------------------------- | :-------: | :-----: | :-: | :---: | :-----: | :-:
Discovery                 | ✓         | ✓       | ✓   | ✓     | ✓       | See notes
└ Name or prefix          | ✓         | ✓       | ✓   | ✓     | ✓       |
Chooser UI                | ✓         | ✓       | ✓   | ✓     | ✓       |
GATT Server Connect       | ✓         | ✓       | ✓   | ✓     |         |
Read Characteristic       | ✓         | ✓       | 53  | ✓     |         |
Write Characteristic      | ✓         | ✓       | 53  | ✓     |         |
Characteristic Properties | ✓         | ✓       | 53  | ✓     |         |
GATT Notifications        | ✓         | &nbsp;&nbsp;✓&nbsp;&nbsp;&nbsp;start <br/> :construction_worker: stop|  53 start  | ✓ |
GATT Server Disconnect    | ✓         | ✓       | ✓   | ✓     |         |
Get Characteristics List  | ✓         | ✓       | 53  | ✓     |         |
Device Disconnected Event | ✓         | ✓       | ✓   | ✓     |         |
Get Primary Services List | 53        | 53      | 53  | 53    |         |

Tip: Chrome channel releases are tracked at [https://googlechrome.github.io/current-versions/](https://googlechrome.github.io/current-versions/).

### Notes

* [Android](https://crbug.com/471536): Requires Android 6, Marshmallow or later.
 * Tip of tree [Chromium builds](https://download-chromium.appspot.com/?platform=Android&type=snapshots) work on Android 5, Lollipop and later for ease of developers - but Chrome versions will only ever support Marshmallow or later. Read [how to play with Web Bluetooth on Lollipop](http://stackoverflow.com/q/34810194/422957).
 * [Android Chooser UI](https://crbug.com/436280) works but has some bugs.
* [Mac](https://crbug.com/364359): Requires OS X Yosemite or later.
  * Some MacBooks may not work: Check "About this Mac" / "System Report" / "Bluetooth" and verify that Low Energy is supported.
* [Linux](https://crbug.com/570344): Requires Kernel 3.19+ and [BlueZ](http://www.bluez.org/) 5.41+ installed. Read [How to get Chrome Web Bluetooth working on Linux](https://acassis.wordpress.com/2016/06/28/how-to-get-chrome-web-bluetooth-working-on-linux/).
  * Note that Bluetooth daemon needs to run with experimental interfaces: `sudo /usr/sbin/bluetoothd -E`
* [Windows](https://crbug.com/507419): Requires Windows 8.1.
  * Discover only manually paired devices.
* iOS: Uses the web exposed APIs as provided by the [WKWebView](https://developer.apple.com/library/ios/documentation/WebKit/Reference/WKWebView_Ref/), no implementation planned in the Chromium codebase.

# Opera
Same as Chrome unless specificied otherwise

# Servo
https://szeged.github.io/servo/

# Firefox
- https://bugzilla.mozilla.org/show_bug.cgi?id=1204396
- https://bugzilla.mozilla.org/buglist.cgi?quicksearch=%5Bweb-bluetooth%5D
 
# Microsoft Edge
https://dev.windows.com/en-us/microsoft-edge/platform/status/webbluetooth

# Safari
https://bugs.webkit.org/show_bug.cgi?id=101034
