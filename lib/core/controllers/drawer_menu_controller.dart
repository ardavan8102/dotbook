import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerMenuController extends GetxController {
  var isOpen = false.obs;

  void toggle(GlobalKey<ScaffoldState> key) {
    if (isOpen.value) {
      key.currentState?.closeDrawer();
    } else {
      key.currentState?.openDrawer();
    }
  }

  void onChanged(bool opened) {
    isOpen.value = opened;
  }
}
