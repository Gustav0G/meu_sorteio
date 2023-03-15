import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyButtonWidget extends StatelessWidget {
  final List<int> numberList;
  final int min;
  final int max;
  final int qtd;

  const CopyButtonWidget({
    super.key,
    required this.min,
    required this.max,
    required this.qtd,
    required this.numberList,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (() {
        Clipboard.setData(
          ClipboardData(
              text:
                  'O resultado do sorteio de $qtd número(s) entre $min e $max foi: $numberList'),
        ).then(
          (value) => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Resultado Copiado'),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.black,
              //padding: EdgeInsets.all(10),
            ),
          ),
        );
      }),
      child: Container(
          height: size.height * 0.19,
          width: size.width * 0.34,
          decoration: BoxDecoration(
              color: const Color(0xff27272C),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 1,
                  offset: Offset(1, 1),
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              SizedBox(width: 30),
              Icon(
                Icons.copy,
                color: Colors.white,
                size: 44,
              ),
              SizedBox(width: 65),
              Text(
                'Copiar',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1),
              )
            ],
          )),
    );
  }
}
