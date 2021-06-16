import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'services/dog.dart';

Future<void> main() async {
  await initServices();

  runApp(DogApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => DogApiServices().init());

  debugPrint('init services end');
}
