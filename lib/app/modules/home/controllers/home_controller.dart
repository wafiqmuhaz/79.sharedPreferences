// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  // ignore: todo
  //TODO: Implement HomeController

  RxInt data = 0.obs;
  RxBool switchToggle = false.obs;

  void decrement() {
    data--;
    simpanData();
  }

  void increment() {
    data++;
    simpanData();
  }

  void simpanToggle() async {
    print('SIMPAN DATA TOGGLE');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('switch', switchToggle.value);
  }

  void bacaToggle() async {
    print('SIMPAN DATA TOGGLE');
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('switch') != false) {
      switchToggle.value = prefs.getBool('switch')!;
    }
  }

  void simpanData() async {
    print('SIMPAN DATA');
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('angka') != null) {
      await prefs.remove('angka');
    }
    await prefs.setInt('angka', data.value);
  }

  void bacaData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('angka') != null) {
      data.value = prefs.getInt('angka')!;
    }
  }

  void resetData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('angka') != null) {
      await prefs.remove('angka');
      data.value = 0;
    } else {}
  }

  // void bacaData() async {
  //   print('BACA DATA');
  //   final prefs = await SharedPreferences.getInstance();
  //   if (prefs.getString('name') != null) {
  //     data.value = prefs.getString('name')!;
  //   }
  //   // return name;
  // }
}
