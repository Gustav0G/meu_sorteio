import 'package:flutter/material.dart';

import '../result_icon/result_icon.dart';

class ResultListview extends StatelessWidget {
  final List<int> numberList;
  const ResultListview({super.key, required this.numberList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: numberList.length,
        padding: const EdgeInsets.symmetric(vertical: 15),
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
    );
  }
}
