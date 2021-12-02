import 'package:get/get.dart';
import 'package:test_task/screens/home/home_binding.dart';
import 'package:test_task/screens/home/home_screen.dart';
import 'package:test_task/screens/second/second_screen.dart';

class AppRoutes {
  static final String home = '/home';
  static final String second = '/second';
}

class AppPage {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.second,
      page: () => SecondScreen(),
      binding: HomeBinding(),
    ),
  ];
}
