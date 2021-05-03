# Manufacturer data and service data filters

This document covers the use cases identified by web developers asking for
manufacturer data and service data filtering support and explains the
specification changes that happened after the [TAG review].

## Use cases

Filtering by device name or prefix may not work for some hardware developers as
their users rename their devices. In addition, most of their advertised services
are custom, thus needing 128-bit UUIDs. Advertising 128-bit UUIDs will occupy
space for important data they want to advertise. Hence, being able to filter on
manufacturer specific data such as the company identifier will help.

Some devices will advertise some proprietary application level packets
encapsulated in manufacturer data or service data. Having a way to filter
devices with a specific pattern inside the manufacturer data or service data
will improve user experience as users will be able to select only Bluetooth
devices that matter to the application.

## API shape

In its simplest form, a manufacturer data filter requires a Bluetooth company
identifier, while a service data filter requires a Bluetooth service UUID.

```js
let manufacturerData = [{ companyIdentifier: 0xffff }];
navigator.bluetooth.requestDevice({ filters: [{ manufacturerData }] });
```

```js
let serviceData = [{ service: "battery_service" }];
navigator.bluetooth.requestDevice({ filters: [{ serviceData }] });
```

Developers can also provide a data prefix that will filter manufacturer data
and service data from devices that start with it.
Examples below show you how to filter Bluetooth devices from Google company with
manufacturer data bytes that start with `[0x01, 0x02]`.

```js
let manufacturerData = [{
  companyIdentifier: 0x00e0, /* Google */
  dataPrefix: new Uint8Array([0x01, 0x02]),
}];
navigator.bluetooth.requestDevice({ filters: [{ manufacturerData }] });
```

A mask can also be used with a data prefix to match some patterns in
manufacturer data and service data.

```js
let manufacturerData = [{
  companyIdentifier: 0xffff,
  dataPrefix: new Uint8Array([0x91, 0xaa]), // 10010001 10101010
  mask: new Uint8Array([0x0f, 0x57]),       // 00001111 01010111
}];
navigator.bluetooth.requestDevice({ filters: [{ manufacturerData }] });
```

Note: If you want to match `[0x01]` and `[0x03]` but not `[0x02]`, you can use
`[0x01]` as the data prefix and `[0xfd]` as the mask to express that the lowest
bit must be `1`, the second bit doesn't matter, and the rest has to be `0`.

## Spec changes since TAG review

When manufacturer data and service data filters were [added] to the spec, they
were plain objects whose key was respectively the company identifier and the
service UUID. It was not easy to understand at first glance and the empty object
wasn't quite readable as well.

```js
// BEFORE
let manufacturerData = { 0x00e0: {} };
navigator.bluetooth.requestDevice({ filters: [{ manufacturerData }] });
```

The unicity of the key had to be checked because developers could use different
strings to express the same key.

```js
// BEFORE
let manufacturerData1 = { "224": {} };
let manufacturerData2 = { "0224": {} };
navigator.bluetooth.requestDevice({ filters: [{ manufacturerData1, manufacturerData2 }] });
```

For those reasons, the spec was [updated] after the TAG review to change those
filters into arrays with a required member which used to be the key.

```diff
   dictionary BluetoothDataFilterInit {
     BufferSource dataPrefix;
     BufferSource mask;
   };

+  dictionary BluetoothManufacturerDataFilterInit : BluetoothDataFilterInit {
+    required [EnforceRange] unsigned short companyIdentifier;
+  };
+
+  dictionary BluetoothServiceDataFilterInit : BluetoothDataFilterInit {
+    required BluetoothServiceUUID service;
+  };
+
   dictionary BluetoothLEScanFilterInit {
    ...
-    // Maps unsigned shorts to BluetoothDataFilters.
-    object manufacturerData;
-    // Maps BluetoothServiceUUIDs to BluetoothDataFilters.
-    object serviceData;
+    sequence<BluetoothManufacturerDataFilterInit> manufacturerData;
+    sequence<BluetoothServiceDataFilterInit> serviceData;
   };
```

[TAG review]: https://github.com/w3ctag/design-reviews/issues/139
[added]: https://github.com/WebBluetoothCG/web-bluetooth/pull/297/
[updated]: https://github.com/WebBluetoothCG/web-bluetooth/pull/545
