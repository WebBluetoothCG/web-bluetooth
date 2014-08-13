# Connecting web sites to Bluetooth devices

This document explores how a web developer might perform various [use cases](http://webbluetoothcg.github.io/web-bluetooth/use-cases.html) using the Web Bluetooth API.
As the Web Bluetooth API isn't fully [specified](http://webbluetoothcg.github.io/web-bluetooth/),
this document invents some function calls and behavior in order to give readers a feeling for what the final code will look like.
Hopefully the intended meaning and behavior are clear enough from context.
If not, please file [issues](https://github.com/WebBluetoothCG/web-bluetooth/issues).

## Discovering and manipulating a Heart Rate Monitor

Imagine we're writing a web site to gather data from a user's heart rate monitor over a Bluetooth Low Energy wireless channel,
using the [org.bluetooth.service.heart_rate](https://developer.bluetooth.org/gatt/services/Pages/ServiceViewer.aspx?u=org.bluetooth.service.heart_rate.xml) service on the device.

First the site needs to get a handle to the device the user wants it to communicate with.
Each service defined by the Bluetooth standard is given an [assigned number](https://www.bluetooth.org/en-us/specification/assigned-numbers),
and the Web Bluetooth API provides [an enumeration for these numbers](http://webbluetoothcg.github.io/web-bluetooth/#idl-def-BluetoothServiceName) that can be used in methods expecting services.

To ask the user for an appropriate device via a filtered device selection dialog UI,
related to the dialog shown by `<input type="file" accept="...">`, we run the following code:

```javascript
var device_promise = navigator.bluetooth.requestDevice([{
    services: ['heart_rate'],
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
    device => device.getService('heart_rate'));
var heart_rate_measurement_promise =
    heart_rate_service_promise.then(service =>
        service.getCharacteristic('heart_rate_measurement');
heart_rate_measurement_promise.then(characteristic => {
    window.characteristic = characteristic;
    return characteristic.startNotifications();
}).then(() => update_ui_that_listening_has_started());
```

To do anything with these notifications, we need to listen to an event on `navigator.bluetooth`:

```javascript
navigator.bluetooth.addEventListener('characteristicvaluechanged', e => {
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
* Add a device using a non-standard UUID to show off the non-string interface.
* Show how to get all instances of a given service UUID, for example to support multiple battery services in a device.
* Show an example of querying a service's UUID to motivate the bluetooth.uuids namespace.
* Register to get notified when a particular device comes in range.
  UA would present user with a dialog asking "which app do you want to handle this device?"
* Handle writing characteristics
* Handle descriptors
