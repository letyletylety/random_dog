import 'dart:convert';

import 'package:dog/resources/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DogApiServices extends GetxService {
  late DogProvider provider;

  static const apiUrl = Resources.randomDogApi;

  Future<DogApiServices> init() async {
    debugPrint('services init');
    provider = DogProvider();
    return this;
  }

  Future<DogApiModel> getImage() async {
    http.Response response = await provider.getDogImage();

    var jsonString = response.body;

    debugPrint('$jsonString');

    Map<String, dynamic> ret = jsonDecode(jsonString) as Map<String, dynamic>;

    debugPrint('ddd');

    // var model = DogApiModel.fromJson(jsonString);
    DogApiModel model = DogApiModel.fromJson(ret);
    return model;
  }
}

class DogProvider {
  Future getDogImage() async {
    http.Response response = await http.get(Uri.parse(Resources.randomDogApi));
    return response;
  }
}

class DogApiModel {
  final String message;
  final String status;

  DogApiModel({
    required this.message,
    required this.status,
  });

  DogApiModel.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String,
        status = json['status'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
