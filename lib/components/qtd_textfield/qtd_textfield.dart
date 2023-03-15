import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meu_sorteio/controller/qtd_textfield_button_controller/qtd_textfield_button_controller.dart';

class QtdTextFieldWidget extends StatefulWidget {
  final TextEditingController controllerQtd;
  const QtdTextFieldWidget({
    Key? key,
    required this.controllerQtd,
  }) : super(key: key);

  @override
  State<QtdTextFieldWidget> createState() => _QtdTextFieldWidgetState();
}

class _QtdTextFieldWidgetState extends State<QtdTextFieldWidget> {
  QtdTextFieldButtonController controller = QtdTextFieldButtonController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quantos números serão sorteados?',
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
            height: 60,
            width: size.width * 0.85,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xff27272C),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              controller: widget.controllerQtd,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
              ],
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              onChanged: ((value) => setState(() {})),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: IconButton(
                  splashRadius: 5,
                  onPressed: () {
                    setState(() {
                      controller.decreaseValue(widget.controllerQtd);
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                suffixIcon: IconButton(
                  splashRadius: 5,
                  onPressed: () {
                    setState(() {
                      controller.increaseValue(widget.controllerQtd);
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
