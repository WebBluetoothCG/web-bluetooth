# Bluetooth requestLEScan API for granted devices

## Motivation

The Bluetooth [requestLEScan](https://webbluetoothcg.github.io/web-bluetooth/scanning.html#dom-bluetooth-requestlescan) API to allows web apps to listen for advertisements from any Bluetooth device. We propose an extension to this API that limits scanning to only devices that the web app has been granted permission to connect to. This is motivated by the following:

* Using the watchAdvertisements API to listen to advertisements from multiple granted devices, which we believe to be the most common scenario, requires complex code to start and manage multiple scanning sessions.
* The requestLEScan API already supports scanning for advertisements from multiple devices and can be augmented with a way to filter advertisements to only devices the site has permission to connect to. This allows user agents to tailor the permission UI for the relevant scenario.

## Interface

```diff
dictionary BluetoothLEScanOptions {
  sequence<BluetoothLEScanFilterInit> filters;
  boolean keepRepeatedDevices = false;
  boolean acceptAllAdvertisements = false;
+ boolean listenOnlyGrantedDevices = false;
};

dictionary BluetoothLEScanFilterInit {
    sequence<BluetoothServiceUUID> services;
    DOMString name;
    DOMString namePrefix;
    sequence<BluetoothManufacturerDataFilterInit> manufacturerData;
+   DOMString id;
};

```

A new flag named **listenOnlyGrantedDevices** will be added to [BluetoothLEScanOptions](https://webbluetoothcg.github.io/web-bluetooth/scanning.html#dictdef-bluetoothlescanoptions) to indicate requestLEScan is being used for listening for granted devices when it is set to `true`. This flag is needed to avoid confusion with the current experimental requestLEScan API which is for surrounding devices in the environment (i.e. including both granted and ungranted devices). The default value for listenOnlyGrantedDevices is `false`.

A new field named **id** will be added to [BluetoothLEScanFilterInit](https://webbluetoothcg.github.io/web-bluetooth/#dictdef-bluetoothlescanfilterinit) for supporting filtering advertisements based on the Bluetooth device identifier, which can persist between browser sessions.

## Usage

To use the new requestLEScan API for granted devices, an app first needs to request permission to access a Bluetooth device using the existing [requestDevice](https://webbluetoothcg.github.io/web-bluetooth/#dom-bluetooth-requestdevice) API. Once the app has permission, it can call the requestLEScan method with `listenOnlyGrantedDevices` field set to `true` to listen for advertisements from granted devices.
The following code snippet shows how to use the new requestLEScan API to listen for advertisements from all granted Bluetooth devices:

```js
let scan = await navigator.bluetooth.requestLEScan({
  acceptAllAdvertisements: true, // This is optional.
  listenOnlyGrantedDevices: true
});

navigator.bluetooth.addEventListener("advertisementreceived", (event) => {
  // Do something with the advertisement data.
});

// To stop scanning.
scan.stop();
```

The field `acceptAllAdvertisements` is optional when `listenOnlyGrantedDevices` is true. Calling the API with only `listenOnlyGrantedDevices` being true effectively acts like accepting all advertisements from granted devices.

If the app wants to filter for certain manufacturer data, it can be done by using the `filters` parameter. In the example below, it listens to advertisements from all granted devices and filters for the advertisements that match a pattern whose company code is `0xE0` and the first byte of the manufacturer data is `0x1`.

```js
let scan = await navigator.bluetooth.requestLEScan({
  filters:[
    {
      manufacturerData: [
        {
          companyIdentifier: 0xE0,
          dataPrefix: new Uint8Array([1])
        }
      ]
    },
  ],
  listenOnlyGrantedDevices: true
});
```

Multiple filters is like taking union of the filters. If the app wants to listen to either:
* A pattern whose company code `0xE0` and the first byte of the manufacturer data is `0x1`.
* A pattern whose company code `0xE0` and the first byte of the manufacturer data is `0x2`.

It can be done as below:

```js
let scan = await navigator.bluetooth.requestLEScan({
  filters:[
    {
      manufacturerData: [
        {
          companyIdentifier: 0xE0,
          dataPrefix: new Uint8Array([1])
        }
      ]
    },
    {
      manufacturerData: [
        {
          companyIdentifier: 0xE0,
          dataPrefix: new Uint8Array([2])
        }
      ]
    },
  ],
  listenOnlyGrantedDevices: true
});
```

The app can also listen to a subset of granted devices, by filtering for name/namePrefix. The below example shows the app wants to listen to bluetooth devices with a name starting with `temp_sensor_` for advertisements with a pattern that the first byte is `0x1`, and bluetooth devices with a name starting with `co2_level_sensor_` for advertisements with a pattern that the first byte is `0x2`.

```js
let devices = await navigator.bluetooth.getDevices();
let scan = await navigator.bluetooth.requestLEScan({
  filters:[
    {
      namePrefix: 'temp_sensor_',
      manufacturerData: [
        {
          companyIdentifier: 0xE0,
          dataPrefix: new Uint8Array([1])
        }
      ]
    },
    {
      namePrefix: 'co2_level_sensor_',
      manufacturerData: [
        {
          companyIdentifier: 0xE0,
          dataPrefix: new Uint8Array([2])
        }
      ]
    },
  ],
  listenOnlyGrantedDevices: true
});
```

Bluetooth device identifier, which persists over browser session restarts, can also be used for filtering. This example below will only show the advertisements from devices with [id](https://webbluetoothcg.github.io/web-bluetooth/index.html#dom-bluetoothdevice-id) equal to `deviceId1` or `deviceId2`.

```js
let devices = await navigator.bluetooth.getDevices();
let scan = await navigator.bluetooth.requestLEScan({
  filters:[
    {
      id: deviceId1
    },
    {
      id: deviceId2
    },
  ],
  listenOnlyGrantedDevices: true
});
```