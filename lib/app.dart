import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home.dart';

class DogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('dogapp build');
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}
