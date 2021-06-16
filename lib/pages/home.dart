import 'package:dog/services/dog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DogController c = Get.put(DogController());

    return Scaffold(
      body: DogView(),
    );
  }
}

class DogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DogController>(
      builder: (c) {
        late Widget child;
        if (c.isLoaded == "success") {
          child = Image.network(
            c.imageUrl,
          );
        } else {
          child = Center(
            child: Container(
              child: Text('no network'),
            ),
          );
        }
        return FittedBox(
          fit: BoxFit.cover,
          child: GestureDetector(
            onTap: () {
              c.newDog();
            },
            child: Center(
              child: Stack(
                children: [
                  child,
                  // Text(
                  //   '',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DogController extends GetxController {
  late String imageUrl;

  /// "success" or not
  late String isLoaded;

  @override
  Future<void> onInit() async {
    super.onInit();
    imageUrl = "";
    isLoaded = "";
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    DogApiModel model = await Get.find<DogApiServices>().getImage();
    imageUrl = model.message;
    isLoaded = model.status;
    update();
  }

  newDog() async {
    debugPrint('new dog');
    DogApiModel model = await Get.find<DogApiServices>().getImage();
    imageUrl = model.message;
    isLoaded = model.status;
    update();
  }
}
