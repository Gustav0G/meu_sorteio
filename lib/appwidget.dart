import 'package:flutter/material.dart';
import 'package:meu_sorteio/pages/home/home.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Sorteio',
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff17171B),
        colorScheme: const ColorScheme.light().copyWith(
          primary: const Color(0xffFEB204),
        ),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
      ),
    );
  }
}
