import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meu_sorteio/model/random_number_model.dart';
import '../result_icon/result_icon.dart';

class HistoryListView extends StatefulWidget {
  final List<RandomNumberModel> resultList;
  const HistoryListView({super.key, required this.resultList});

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.resultList.length,
      itemBuilder: (context, index) {
        List<String> token = [];
        token = widget.resultList[index].numberResult.toString().split(',');
        return HistoryCard(
          numberList: token,
          maxValue: widget.resultList[index].maxValue.toString(),
          qtd: widget.resultList[index].qtdNumbers.toString(),
          minValue: widget.resultList[index].minValue.toString(),
        );
      },
    );
  }
}

class HistoryCard extends StatelessWidget {
  final List<String> numberList;
  final String qtd;
  final String minValue;
  final String maxValue;
  const HistoryCard({
    super.key,
    required this.numberList,
    required this.qtd,
    required this.minValue,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    double size1 = 22;
    double size2 = 16;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: const Color(0xff26262c),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 240,
                  child: Text(
                    'Sorteio de $qtd ${int.parse(qtd) == 1 ? 'número' : 'números'}',
                    style:
                        TextStyle(fontSize: size1, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(
                            text:
                                'O resultado do sorteio de $qtd número(s) entre $minValue e $maxValue foi: $numberList'),
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
                    },
                    icon: const Icon(Icons.copy, color: Colors.white)),
              ],
            ),
            RichText(
              text: TextSpan(
                  text: 'Entre os valores de ',
                  style: TextStyle(fontSize: size2),
                  children: [
                    TextSpan(
                        text: minValue,
                        style: TextStyle(
                          fontSize: size2,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                      text: ' a ',
                      style: TextStyle(fontSize: size2),
                    ),
                    TextSpan(
                      text: maxValue,
                      style: TextStyle(
                        fontSize: size2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 95,
              child: ListView.builder(
                itemCount: numberList.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: ResultIcon(
                      number: numberList[index].toString(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//refatorar classe
