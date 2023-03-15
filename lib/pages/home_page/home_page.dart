import 'package:flutter/material.dart';
import 'package:meu_sorteio/components/qtd_textfield/qtd_textfield.dart';
import '../../components/generate_random_number_options/generate_random_number_options.dart';
import '../../components/range_textfield/range_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController controllerQtd = TextEditingController(text: '1');
TextEditingController controllerMin = TextEditingController(text: '1');
TextEditingController controllerMax = TextEditingController(text: '100');

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    controllerMax.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    controllerMin.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    controllerQtd.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Sorteio'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 75),
              QtdTextFieldWidget(controllerQtd: controllerQtd),
              const SizedBox(height: 50),
              RangeTextFieldWidget(
                controllerMin: controllerMin,
                controllerMax: controllerMax,
              ),
              const SizedBox(height: 50),
              GenerateRandomNumberOptionsWidget(
                max: controllerMax.text.isEmpty
                    ? 100
                    : int.parse(controllerMax.text),
                min: controllerMin.text.isEmpty
                    ? 1
                    : int.parse(controllerMin.text),
                qtd: controllerQtd.text.isEmpty
                    ? 1
                    : int.parse(controllerQtd.text),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
