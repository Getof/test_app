import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/main_controller.dart';

class AppHeader extends SliverPersistentHeaderDelegate {
  final double minExtent;
  final double maxExtent;

  AppHeader({required this.minExtent, required this.maxExtent});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.transparent,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
