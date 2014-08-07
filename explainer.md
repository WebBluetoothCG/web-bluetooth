# Connecting web sites to Bluetooth devices

This document explores how a web developer might perform various [use cases](http://webbluetoothcg.github.io/web-bluetooth/use-cases.html) using the Web Bluetooth API.
As the Web Bluetooth API isn't fully [specified](http://webbluetoothcg.github.io/web-bluetooth/),
this document invents some function calls and behavior in order to give readers a feeling for what the final code will look like.
Hopefully the intended meaning and behavior are clear enough from context.
If not, please file [issues](https://github.com/WebBluetoothCG/web-bluetooth/issues).

## Discovering and manipulating a Heart Rate Monitor

Imagine we're writing a web site to gather data from a user's heart rate monitor over a Bluetooth Low Energy wireless channel,
using the [org.bluetooth.service.heart_rate](https://developer.bluetooth.org/gatt/services/Pages/ServiceViewer.aspx?u=org.bluetooth.service.heart_rate.xml) service on the device.

First the site needs to get a handle to the device the user wants it to communicate with
Each service defined by the Bluetooth standard is given an [assigned number](https://www.bluetooth.org/en-us/specification/assigned-numbers),
and the Web Bluetooth API provides symbolic names for these numbers in the `navigator.bluetooth.uuids` namespace.
`navigator.bluetooth.uuids.service.heart_rate` identifies the heart_rate service.

To ask the user for an appropriate device via a filtered device selection dialog UI,
related to the dialog shown by `<input type="file" accept="...">`, we run the following code:

```javascript
var bt = navigator.bluetooth;
var device_promise = bt.requestDevice([{
    services: [bt.uuids.service.heart_rate],
}]);
```

(TODO: insert a picture of this UI).

`device_promise` will reject if there's no nearby device matching the filter or the user cancels the dialog.
If it succeeds, it resolves with a `Device` object that can be used to communicate with the device.

Next let's register for notifications when a heart rate is found.
The [org.bluetooth.characteristic.heart_rate_measurement characteristic](https://developer.bluetooth.org/gatt/characteristics/Pages/CharacteristicViewer.aspx?u=org.bluetooth.characteristic.heart_rate_measurement.xml)
describes the currently-measured heart rate, as one might expect.

```javascript
var heart_rate_service_promise = device_promise.then(
    device => device.findServices(bt.uuids.service.heart_rate));
var heart_rate_measurement_promise =
    heart_rate_service_promise.then(service =>
        service[0].findCharacteristics(bt.uuids.characteristic.heart_rate_measurement);
heart_rate_measurement_promise.then(characteristic => {
    window.characteristic = characteristic[0];
    return characteristic[0].startNotifications();
}).then(() => update_ui_that_listening_has_started());
```

To do anything with these notifications, we need to listen to an event on `navigator.bluetooth`:

```javascript
bt.addEventListener('characteristicvaluechanged', e => {
    if (e.characteristic === window.characteristic) {
        report_heart_rate(parse_heart_rate(e.characteristic.value));
    }
});
```

Next we have to consult the [heart_rate_measurement documentation](https://developer.bluetooth.org/gatt/characteristics/Pages/CharacteristicViewer.aspx?u=org.bluetooth.characteristic.heart_rate_measurement.xml) to parse the `ArrayBuffer`.

```javascript
function parse_heart_rate(buffer) {
    data = new DataView(buffer);
    var flags = data.getUint8(0);
    var rate_16_bits = flags & 0x1;
    if (rate_16_bits) {
        return data.getUint16(1, /*littleEndian=*/true);
    } else {
        return data.getUint8(1);
    }
}
```


## TODO
* Register to get notified when a particular device comes in range.
  UA would present user with a dialog asking "which app do you want to handle this device?"
* Handle writing characteristics
* Handle descriptors
