import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './tabScreen/home.dart';
import './tabScreen/main.dart';
import './tabScreen/setting.dart';
import '../controllers/tabs_controller.dart';

class Tabs extends StatelessWidget {

  final TextStyle unselectedTabStyle = TextStyle(
      fontSize: 12.0,
      color: Colors.black.withOpacity(0.6),
      fontWeight: FontWeight.w500
  );

  final TextStyle selectedTabStyle = TextStyle(
      fontSize: 12.0,
      color: Colors.black,
      fontWeight: FontWeight.w500
  );

  buildBottomNavigationMenu(context,controller){

    return Obx(()=> MediaQuery(
        data:MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child:
        SizedBox(
          height:54,
          child:BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.black.withOpacity(0.4),
            selectedItemColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.tabIndex.value,
            onTap: controller.changeTabIndex,
            unselectedLabelStyle: unselectedTabStyle,
            selectedLabelStyle: selectedTabStyle,
            items: [
              const BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: "首页"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_comment),
                label: "内容",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "我的",
              ),
            ],
          ),
        )
    ));

  }

  @override
  Widget build(BuildContext context) {
    final TabsController controller = Get.put(TabsController(),permanent:false);
    return SafeArea(
        child:Scaffold(
          bottomNavigationBar: buildBottomNavigationMenu(context,controller),
          body:Obx(()=>IndexedStack(
            index: controller.tabIndex.value,
            children: [
              Home(),
              Main(),
              Setting(),
            ],
          )),
        )
    );
  }
}