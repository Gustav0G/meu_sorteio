import 'package:flutter/material.dart';
import 'package:meu_sorteio/pages/history/history_page.dart';
import 'package:meu_sorteio/pages/home_page/home_page.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

List _pageList = [
  const HomePage(),
  const HistoricPage(),
];
int selectedIndex = 0;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: ((value) => setState(() {
              selectedIndex = value;
            })),
        elevation: 0,
        iconSize: 28,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Histórico',
          ),
        ],
      ),
    );
  }
}
