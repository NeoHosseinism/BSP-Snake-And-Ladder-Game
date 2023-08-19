import 'package:flutter/material.dart';

import '../../../../../utils.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          reverse: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10,
          ),
          itemBuilder: (_, index) {
            return Container(
              key: keys[index],
              decoration: BoxDecoration(
                color: ((index ~/ 10) % 2 == 0) && (index % 2 == 0)
                    ? Colors.brown
                    : ((index ~/ 10) % 2 == 1) && (index % 2 == 1)
                        ? Colors.brown
                        : Colors.brown[800],
                borderRadius:
                    (index == 0 || index == 9 || index == 90 || index == 99)
                        ? setBorderRadius(index)
                        : null,
              ),
              child: Center(
                child: Text(
                  ((index ~/ 10) % 2 == 1)
                      ? (((index ~/ 10) * 20) + 10 - index).toString()
                      : (index + 1).toString(),
                  style: const TextStyle(color: Colors.amber),
                ),
              ),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }

  setBorderRadius(int index) {
    switch (index) {
      case 0:
        return const BorderRadius.only(bottomLeft: Radius.circular(17.5));
      case 9:
        return const BorderRadius.only(bottomRight: Radius.circular(17.5));
      case 90:
        return const BorderRadius.only(topLeft: Radius.circular(17.5));
      case 99:
        return const BorderRadius.only(topRight: Radius.circular(17.5));
      default:
    }
  }
}
