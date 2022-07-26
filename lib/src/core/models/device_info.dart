import 'package:flutter/material.dart';

import '../shared/get_device_type.dart';

class DeviceInfo {
  final Orientation? orientation;
  final DeviceType? deviceType;
  final double? screenWidth;
  final double? screenHeight;
  final double? localHeight;
  final double? localWidth;

  DeviceInfo({
    this.orientation, this.deviceType, this.screenWidth,
    this.screenHeight, this.localHeight, this.localWidth});
}
