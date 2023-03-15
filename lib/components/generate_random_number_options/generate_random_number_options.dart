import 'package:flutter/material.dart';
import 'package:meu_sorteio/components/generate_random_number_button/generate_random_number_button.dart';

class GenerateRandomNumberOptionsWidget extends StatefulWidget {
  final int? qtd;
  final int? min;
  final int? max;

  const GenerateRandomNumberOptionsWidget({
    super.key,
    this.qtd,
    this.min,
    this.max,
  });

  @override
  State<GenerateRandomNumberOptionsWidget> createState() =>
      _GenerateRandomNumberOptionsWidgetState();
}

bool switchValueOrder = false;
bool switchValueRepeat = false;

class _GenerateRandomNumberOptionsWidgetState
    extends State<GenerateRandomNumberOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                color: switchValueOrder
                    ? Theme.of(context).colorScheme.primary
                    : const Color(0xff27272C),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Switch(
                  thumbColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (switchValueOrder == false) {
                      return Theme.of(context).colorScheme.primary;
                    } else {
                      return Colors.white;
                    }
                  }),
                  activeColor: Theme.of(context).colorScheme.primary,
                  inactiveTrackColor: const Color(0xff27272C),
                  activeTrackColor: Colors.transparent,
                  value: switchValueOrder,
                  onChanged: (value) {
                    setState(() {
                      switchValueOrder = value;
                      print(value);
                    });
                  }),
            ),
            const SizedBox(width: 10),
            const Text(
              'Exibir o resultado em ordem crescente ',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              decoration: BoxDecoration(
                color: switchValueRepeat
                    ? Theme.of(context).colorScheme.primary
                    : const Color(0xff27272C),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Switch(
                thumbColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (switchValueRepeat == false) {
                    return Theme.of(context).colorScheme.primary;
                  } else {
                    return Colors.white;
                  }
                }),
                activeColor: Theme.of(context).colorScheme.primary,
                inactiveTrackColor: const Color(0xff27272C),
                activeTrackColor: Colors.transparent,
                value: switchValueRepeat,
                onChanged: (value) {
                  setState(() {
                    switchValueRepeat = value;
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Não repetir um número já sorteado',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 60,
          child: Text(
            textAlign: TextAlign.center,
            _errorText!,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        GenerateRandomNumberButtonWidget(
          order: switchValueOrder,
          min: widget.min,
          max: widget.max,
          qtd: widget.qtd,
          repeat: switchValueRepeat,
        )
      ],
    );
  }

  String? get _errorText {
    if (widget.min! > widget.max!) {
      return 'O valor minímo não pode ser maior que o máximo.';
    }
    if (widget.qtd! > widget.max!) {
      return 'A quantidade de números não pode ser maior que o máximo.';
    }
    if (widget.qtd! != 1 &&
        widget.qtd! == widget.min! &&
        widget.qtd! != 1 &&
        widget.qtd! == widget.max! &&
        switchValueRepeat == true) {
      return 'Impossível de sortear com os valores informados e a opção de repetição ativa.';
    }
    return '';
  }
}
