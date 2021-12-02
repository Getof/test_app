import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:test_task/app_routs.dart';

class MainController extends GetxController {
  RxDouble dist = 0.0.obs;
  int listLength = 10;
  int destIndex = -1;
  ScrollController scrollController = ScrollController();
  ScrollController scrollListController = ScrollController();
  TextEditingController textEditingController = TextEditingController();

  @override
  void onReady() {
    scrollController.addListener(() {
      dist.value = scrollController.offset * math.pi / 360;
    });
    super.onReady();
  }

  void returnHome(bool res) {
    Get.back(result: res);
  }

  void goSecondScreen(int index) async {
    destIndex = index;
    textEditingController.text = index.toString();
    final res = await Get.toNamed(AppRoutes.second);
    if (res) {
      // update();

      scrollListController.animateTo((100 * destIndex).toDouble(),
          duration: Duration(milliseconds: 1000), curve: Curves.easeOut);
    }
    update();
  }

  void validateNumber(String val) {
    String pattern = r'^[0-9]+$';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(val)) {
      destIndex = int.parse(val);
      returnHome(true);
    } else {
      returnHome(false);
    }
  }

  void validateValue(String val) {
    if (val.isNotEmpty) {
      if (int.parse(val) > listLength - 1) {
        textEditingController.text = (listLength - 1).toString();
      }
    }
  }
}
