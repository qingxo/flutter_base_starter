import 'package:get/get.dart';
import 'dart:async';
class SplashController extends GetxController {
  var time = 3000.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    downCount();
  }

  @override
  void onReady(){
    super.onReady();
  }
  @override
  void dispose(){
    super.dispose();
  }

  void downCount() {
    Future.delayed(Duration(seconds: 1),(){
      time.value =(time.value - 1000);
      update();
      if(time.value>0){
        downCount();
      }else if(time.value == 0){
        Get.toNamed('tabs');
      }

    });
  }


}