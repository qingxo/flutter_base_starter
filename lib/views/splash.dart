import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SplashController controller =
    Get.put(SplashController(), permanent: false);
    return Scaffold(
        body: Obx(() => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Center(
            child: Text('Splash Screen time: ${controller.time.value}',
                style:
                TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
        )));
  }
}
