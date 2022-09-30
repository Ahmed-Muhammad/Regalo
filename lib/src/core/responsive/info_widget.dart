import 'package:flutter/material.dart';

import '../models/device_info.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext context, DeviceInfo deviceInfo) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var mediaQueryData = MediaQuery.of(context);
        var deviceInfo = DeviceInfo(
          orientation: mediaQueryData.orientation,
          // deviceType: getDeviceType(mediaQueryData),
          screenHeight: mediaQueryData.size.height,
          screenWidth: mediaQueryData.size.width,
          localHeight: constraints.maxHeight,
          localWidth: constraints.maxWidth,
        );
        return builder(context, deviceInfo);
      },
    );
  }
}
