import 'package:flutter/material.dart';

class ResultIcon extends StatelessWidget {
  final String number;
  const ResultIcon({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: number.length == 1 ? 20 : 10,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: const Color(0xff27272C),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 4,
            ),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(seconds: 2),
          padding: EdgeInsets.symmetric(
            horizontal: number.length == 1 ? 20 : 10,
            vertical: 10,
          ),
          curve: Curves.linearToEaseOut,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 4,
            ),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
