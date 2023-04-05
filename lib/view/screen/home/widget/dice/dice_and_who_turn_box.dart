import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../global.dart';
import 'dice.dart';

class DiceAndWhoTurnBox extends StatelessWidget {
  const DiceAndWhoTurnBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FutureBuilder(
          future: Future.delayed(Duration(milliseconds: diceAnimationDuration)),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Visibility(
                visible: true,
                child: Center(
                  child: Lottie.asset(
                    "assets/gifs/131706-dice-6.json",
                    height: 75,
                  ),
                ),
              );
            } else {
              diceAnimationDuration = 2000;
              currentDiceNum = Random().nextInt(6) + 1;
              return Visibility(
                visible: true,
                child: Dice(currentDiceNum),
              );
            }
          },
        ),
        GestureDetector(
          onTap: () {
            // start dice rolling
            // setState(() {});
          },
          child: Column(
            children: [
              const Text(
                "نوبت : بازیکن 1",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(color: Colors.white, width: 5),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}