import 'package:flutter/material.dart';

import '../../../core/shared/get_device_type.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    double screenHeight = mediaQueryData.size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            var deviceType = getDeviceType(mediaQueryData);
            print(deviceType);
            double height = constraints.maxHeight;
            double width = constraints.maxWidth;
            print('screenHeight => $screenHeight');
            print('----------------');
            print('height  => $height');
            print('---------------');
            print('screenWidth  => $screenWidth');
            print('---------------');
            print('width  => $width');
            print('--------------');
            return Container(
              height: height / 2,
              width: width / 2,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
            );
          },
        ),
      ),
    );
  }

}


