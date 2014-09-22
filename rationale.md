# Rationale for Web Bluetooth design decisions

This document attempts to explain why various decisions were made the way they were.

## Why only BTLE, Central, and Client?

* The key/value structure of GATT is believed to reduce the risk of device exploits
  compared to the unstructured byte-stream of other protocols.
  When the <i>Characteristic Aggregate Format</i> and <i>Characteristic Presentation Format</i>
  <a title="Descriptor">Descriptors</a> are provided for a <a>Characteristic</a>,
  the UA can further validate any data passed to the device.

* Energy usage is becoming more important, especially on mobile devices,
  and the BTLE spec is significantly more optimized for this concern.

* Future devices are increasingly likely to support BTLE,
  so supporting that in the first version of the web API provides more long-term reach
  than supporting Bluetooth Classic first.
  The disadvantage of this choice is that fewer current devices and operating systems support BTLE.

* While devices that run web browsers can benefit from <a>Peripheral</a> support,
  more use cases require <a>Central</a> support.

* While the <a>Server</a> role can work in a <a>Central</a> device,
  <a>Client</a> is more natural and is required for more use cases.

## Why so many `Get{,All}{Service,Characteristic,Descriptor}()` overloads?

GATT provides two ways of finding primary services:
_Discover All Primary Services_ and _Discover Primary Service by Service UUID_.
Each can be stopped early if the desired service is found.
_Discover All Primary Services_ encodes the result more efficiently:
each response packet can include multiple services,
while the _by Service UUID_ variant only returns one service per packet.
Although we don't want to require UAs to do anything
beyond discovering all services on connection,
we'd like to allow them to optimize their use of the radio.

* The fact that the procedures can stop early means
  it could help to declare that a call only needs one result.
* The _by Service UUID_ variant means it could help to accept a single UUID argument.
* Developers also need to be able to get access to all instances of a single UUID,
  for example to retrieve the services describing several batteries in a device.

This covers `Promise<Service> getService(UUID)`,
`Promise<Service> getAnyService(sequence<UUID>)`,
`Promise<sequence<Service>> getAllServices(UUID)`, and
`Promise<sequence<Service>> getAllServices()`.
(We currently omit `Promise<Service> getAnyService(sequence<UUID>)`
to keep the API a bit smaller.)

If a developer wants to interact with a set of services,
the above set of functions makes them choose between calling `getService(UUID)` several times,
or calling `getAllServices()` and filtering out the results they're not interested in.
Calling `getService(UUID)` several times may cause the UA to waste round trips
given the less efficient encoding of the response to _Discover Primary Service by Service UUID_.
So we offer `Promise<sequence<Service>> getAllServices(sequence<UUID>)`
to let the developer express their goals up front, so the UA can optimize appropriately.

Only services and characteristics offer the _by UUID_ procedure,
but we offer the full set of overloads for included services and descriptors as well
so that the API doesn't have unexpected gaps.

## Why does `getAllServices()` return only primary services?

GATT allows a service to be either "primary" or "secondary" and
allows the _Read By Group Type Request_ to ask for an enumeration of either (3.G.2.5.3).
However, all secondary services are also included services in some primary service (1.A.6.5.1),
and having `getAllServices()` include them would cost an extra request sequence.

The current API does give UAs the freedom to scan for secondary services eagerly.

## When a device supports both Notification and Indication, why not give the site control of which to use?

The [Mac API](https://developer.apple.com/library/ios/documentation/CoreBluetooth/Reference/CBPeripheral_Class/index.html#//apple_ref/doc/uid/TP40011289-CH1-SW6)
defaults to Notification,
and the [Android API](https://developer.android.com/reference/android/bluetooth/BluetoothGatt.html#setCharacteristicNotification%28android.bluetooth.BluetoothGattCharacteristic, boolean%29)
doesn't document which it prefers when both are available.
Neither gives enough control to
implement a web standard that gives the web page the ability to choose.
