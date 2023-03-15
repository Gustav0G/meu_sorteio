import 'package:flutter/material.dart';
import 'package:meu_sorteio/controller/homepage_controller/homepage_controller.dart';
import 'package:meu_sorteio/model/random_number_model.dart';
import 'package:meu_sorteio/pages/result_page/result_page.dart';
import 'package:meu_sorteio/repository/repository.dart';

class GenerateRandomNumberButtonWidget extends StatelessWidget {
  final int? qtd;
  final int? min;
  final int? max;
  final bool? order;
  final bool? repeat;

  const GenerateRandomNumberButtonWidget(
      {super.key, this.qtd, this.min, this.max, this.order, this.repeat});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: min! > max! ||
              qtd! > max! ||
              (qtd! != 1 &&
                  qtd! == min! &&
                  qtd! != 1 &&
                  qtd! == max &&
                  repeat == true)
          ? null
          : () {
              HomePageController controller = HomePageController();
              List<int> result =
                  controller.generateRandomNumber(max, min, qtd, order, repeat);
              String resultString = result[0].toString();

              for (int i = 1; i < result.length; i++) {
                resultString += ',${result[i]}';
              }
              RandomNumberModel numberModel = RandomNumberModel(
                qtdNumbers: qtd,
                minValue: min,
                maxValue: max,
                numberResult: resultString,
              );
              Repository repository = Repository();
              repository.insertResults(numberModel);

              Navigator.push(
                  context,
                  _animatedRoute(
                      result: result, min: min!, max: max!, qtd: qtd!));
            },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
      ),
      child: const Text(
        'Sortear!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

Route _animatedRoute({
  required List<int> result,
  required int min,
  required int max,
  required int qtd,
}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(seconds: 1),
    pageBuilder: (BuildContext context, animation, secondaryAnimation) =>
        ResultPage(
      numberResult: result,
      min: min,
      max: max,
      qtd: qtd,
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween(begin: const Offset(0, 1), end: Offset.zero).chain(
            CurveTween(curve: Curves.linear),
          ),
        ),
        child: child,
      );
    },
  );
}
