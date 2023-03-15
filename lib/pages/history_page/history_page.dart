import 'package:flutter/material.dart';
import 'package:meu_sorteio/components/history_listview/history_listview.dart';
import 'package:meu_sorteio/model/random_number_model.dart';
import '../../repository/repository.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({super.key});

  @override
  State<HistoricPage> createState() => _HistoricPageState();
}

List<RandomNumberModel> numberList = [];

class _HistoricPageState extends State<HistoricPage> {
  _loadList() async {
    Repository repository = Repository();
    numberList = await repository.readResults();
    setState(() {});
  }

  @override
  void initState() {
    _loadList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Histórico'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Excluir Histórico'),
                      content:
                          const Text('Deseja apagar o histórico de sorteios?'),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      actionsAlignment: MainAxisAlignment.spaceAround,
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancelar',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Repository repository = Repository();
                            repository.clearResults();
                            numberList.clear();
                            setState(() {});
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.done),
                          label: const Text(
                            'Confirmar',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        )
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: numberList.isEmpty == true
            ? const Center(
                child: Text(
                'Não há nada por aqui :(',
                style: TextStyle(fontSize: 20),
              ))
            : HistoryListView(
                resultList: numberList,
              ),
      ),
    );
  }
}
