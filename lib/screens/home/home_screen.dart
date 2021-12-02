import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_task/components/app_header.dart';
import 'package:test_task/components/line_content.dart';
import 'package:test_task/main_controller.dart';

class HomeScreen extends GetWidget<MainController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.white,
      ),
      Positioned(
        top: -Get.width * 1.2 / 2,
        left: -Get.width * 1.2 / 2,
        child: Obx(
          () => Transform.rotate(
            angle: controller.dist.value,
            child: SvgPicture.asset('assets/circle.svg'),
          ),
        ),
        width: Get.width * 1.2,
        height: Get.width * 1.2,
      ),
      NestedScrollView(
          controller: controller.scrollController,
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverPersistentHeader(
                delegate: AppHeader(minExtent: 0, maxExtent: 380),
                pinned: false,
                floating: false,
              ),
            ];
          },
          body: Builder(
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: CustomScrollView(slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 38,
                            ),
                            LineSup(150, 48, 30, 'text'),
                            SizedBox(
                              height: 16,
                            ),
                            LineSup(250, 48, 30, 'text'),
                            SizedBox(
                              height: 16,
                            ),
                            LineSup(200, 48, 30, 'text'),
                            SizedBox(
                              height: 16,
                            ),
                          ]),
                    ]),
                  ),
                  SliverToBoxAdapter(
                    child: GetBuilder<MainController>(builder: (b) {
                      return Container(
                        height: 100.0,
                        child: ListView.builder(
                          controller: b.scrollListController,
                          scrollDirection: Axis.horizontal,
                          itemCount: b.listLength,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 100.0,
                              child: Card(
                                color: b.destIndex == index
                                    ? Colors.red
                                    : Colors.white,
                                child: InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      index.toString(),
                                    ),
                                  ),
                                  onTap: () => b.goSecondScreen(index),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                ]),
              );
            },
          )

          // CustomScrollView(shrinkWrap: true, slivers: [
          //   Container(
          //     decoration: BoxDecoration(
          //       color: Colors.grey[300],
          //       borderRadius: BorderRadius.only(
          //         topRight: Radius.circular(15),
          //         topLeft: Radius.circular(15),
          //       ),
          //     ),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         SizedBox(
          //           height: 38,
          //         ),
          //         LineSup(150, 48, 30, 'text'),
          //         SizedBox(
          //           height: 16,
          //         ),
          //         LineSup(250, 48, 30, 'text'),
          //         SizedBox(
          //           height: 16,
          //         ),
          //         LineSup(200, 48, 30, 'text'),
          //         SizedBox(
          //           height: 16,
          //         ),

          //         // Expanded(
          //         //     child: ListView.builder(
          //         //         shrinkWrap: true,
          //         //         scrollDirection: Axis.vertical,
          //         //         itemCount: 2,
          //         //         itemBuilder: (context, index) {
          //         //           return ListTile();
          //         //         }))
          //         // Row(children: [
          //         //   GetBuilder<MainController>(builder: (builder) {
          //         //     return ListView.builder(
          //         //         scrollDirection: Axis.horizontal,
          //         //         itemCount: 2,
          //         //         itemBuilder: (context, index) {
          //         //           return ListTile();
          //         //         });
          //         //   }),
          //         // ]),
          //       ],
          //     ),
          //   ),
          // ]),
          ),
    ]);
  }
}
