import 'package:flutter/material.dart';

class QtdTextFieldButtonController {
  increaseValue(TextEditingController controllerQtd) {
    if (controllerQtd.text.isEmpty) {
      controllerQtd.text = '1';
    } else {
      int value = int.parse(controllerQtd.text);
      value++;
      controllerQtd.text = value.toString();
    }
  }

  decreaseValue(TextEditingController controllerQtd) {
    if (controllerQtd.text.isEmpty) {
      controllerQtd.text = '1';
    }
    int value = int.parse(controllerQtd.text);
    if (value > 1) {
      value--;
      controllerQtd.text = value.toString();
      print(controllerQtd.text);
    }
  }
}
