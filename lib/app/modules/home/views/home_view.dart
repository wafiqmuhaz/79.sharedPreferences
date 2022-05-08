// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.bacaData();
    controller.bacaToggle();

    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => controller.resetData(),
            icon: Icon(Icons.restore),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                '${controller.data}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => controller.decrement(),
                  child: Column(
                    children: [
                      Text(
                        '-',
                      ),
                      Icon(Icons.remove),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => controller.increment(),
                  child: Column(
                    children: [
                      Text('+'),
                      Icon(Icons.add),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.switchToggle.toggle();
          controller.simpanToggle();
        },
        child: Icon(Icons.swipe_down),
      ),
    );
  }
}
