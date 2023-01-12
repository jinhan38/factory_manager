import 'dart:io';

import 'package:flutter/services.dart';

class LightSensor {
  static const EventChannel _eventChannel = EventChannel("lightSensorEvent");

  Stream<int>? _sensorStream;

  Stream<int> get sensorStream {
    if (!Platform.isAndroid) {
      throw Exception("LightSensor work only Android");
    }
    _sensorStream ??=
        _eventChannel.receiveBroadcastStream().map((value) => value);
    return _sensorStream!;
  }
}
