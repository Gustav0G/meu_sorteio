import 'package:flutter/material.dart';

class BackPageButtonWidget extends StatelessWidget {
  const BackPageButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (() => Navigator.pop(context)),
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
                Icons.arrow_back,
                color: Colors.white,
                size: 44,
              ),
              SizedBox(width: 65),
              Text(
                'Voltar',
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
