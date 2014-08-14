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

