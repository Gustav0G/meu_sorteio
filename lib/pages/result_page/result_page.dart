import 'package:flutter/material.dart';
import 'package:meu_sorteio/components/back_page_button/back_page_button.dart';
import 'package:meu_sorteio/components/copy_button/copy_button.dart';
import 'package:meu_sorteio/components/result_listview/result_listview.dart';

class ResultPage extends StatefulWidget {
  final List<int> numberResult;
  final int min;
  final int max;
  final int qtd;
  const ResultPage(
      {super.key,
      required this.numberResult,
      required this.min,
      required this.max,
      required this.qtd});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Resultado'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: Image.asset(
                  'assets/img/result_img.png',
                  color: Theme.of(context).colorScheme.primary,
                  width: 190,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                ' ${widget.numberResult.length}  ${widget.numberResult.length > 1 ? 'Números Sorteados' : 'Número Sorteado'}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text('Entre os valores de ${widget.min} a ${widget.max}'),
              const SizedBox(
                height: 35,
              ),
              ResultListview(
                numberList: widget.numberResult,
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const BackPageButtonWidget(),
                  CopyButtonWidget(
                    min: widget.min,
                    max: widget.max,
                    qtd: widget.qtd,
                    numberList: widget.numberResult,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
