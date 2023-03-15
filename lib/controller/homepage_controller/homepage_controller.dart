import 'dart:math';
import 'package:flutter/cupertino.dart';

class HomePageController extends ChangeNotifier {
  List<int> numberResult = [];

  List<int> generateRandomNumber(
      int? max, int? min, int? qtd, bool? order, bool? repeat) {
    Random random = Random();
    if (repeat == true) {
      for (int i = 0; numberResult.length < qtd!; i++) {
        int randomNumber = min! + random.nextInt(max! + 1 - min);
        if (!numberResult.contains(randomNumber)) {
          numberResult.add(randomNumber);
        }
      }
    } else {
      for (int i = 0; numberResult.length < qtd!; i++) {
        int randomNumber = min! + random.nextInt(max! + 1 - min);
        numberResult.add(randomNumber);
      }
    }
    if (order == true) {
      print(numberResult..sort());
      numberResult = numberResult..sort();
    } else if (order == false) {
      print(numberResult);
    }
    return numberResult;
  } //print(numberResult..sort()); //printar em ordem crescente (..)

}
