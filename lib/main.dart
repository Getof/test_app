import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/app_routs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.home,
      getPages: AppPage.pages,
    );
  }
}
