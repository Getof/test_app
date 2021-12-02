import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:test_task/main_controller.dart';

class SecondScreen extends GetWidget<MainController> {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: Align(
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                controller.returnHome(false);
              },
            ),
          ),
        ),
        centerTitle: true,
        title: Text('Second screen'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                controller: controller.textEditingController,
                onChanged: (value) {
                  controller.validateValue(value);
                },
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  controller
                      .validateNumber(controller.textEditingController.text);
                },
                child: Text('Сохранить'),
              ),
            ]),
      ),
    );
  }
}
