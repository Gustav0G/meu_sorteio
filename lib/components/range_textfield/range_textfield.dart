import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RangeTextFieldWidget extends StatelessWidget {
  final TextEditingController controllerMin;
  final TextEditingController controllerMax;
  const RangeTextFieldWidget(
      {super.key, required this.controllerMin, required this.controllerMax});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Número minímo',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: size.width * 0.35,
              // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xff27272C),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: controllerMin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                    border: InputBorder.none, errorMaxLines: 2),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Número máximo',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: size.width * 0.35,
              // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xff27272C),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: controllerMax,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ],
                onChanged: (value) {},
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ],
        )
      ],
    );
  }
}
