import 'package:flutter/material.dart';

import 'dice_per_num.dart';

class Dice extends StatelessWidget {
  final int diceNum;
  const Dice(this.diceNum, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(22),
            ),
            child: DicePerNum(diceNum),
          ),
        ],
      ),
    );
  }
}
