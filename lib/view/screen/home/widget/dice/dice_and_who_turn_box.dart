import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:snake_and_ladder/controller/home/home.dart';

import '../../../../../global.dart';
import 'dice.dart';

final HomeCtrl homeCtrl = Get.put(HomeCtrl());
bool diceRolling = false;

class DiceAndWhoTurnBox extends StatefulWidget {
  const DiceAndWhoTurnBox({super.key});

  @override
  State<DiceAndWhoTurnBox> createState() => _DiceAndWhoTurnBoxState();
}

class _DiceAndWhoTurnBoxState extends State<DiceAndWhoTurnBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (diceRolling)
          Center(
            child: Lottie.asset(
              "assets/gifs/131706-dice-6.json",
              height: 75,
            ),
          ),
        if (!diceRolling) Dice(homeCtrl.currentDiceNum.value),
        GestureDetector(
          onTap: () async {
            await showDiceRollingAnimation();
            await homeCtrl.showDiceNumAndMovePlayerToken();
          },
          child: Column(
            children: [
              Text(
                "نوبت : ${players[whoIsTurn].name}",
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: List.generate(
                  players.length,
                  (index) {
                    return Container(
                      height: 25,
                      width: 25,
                      margin: index != players.length - 1
                          ? const EdgeInsets.only(right: 8)
                          : null,
                      decoration: BoxDecoration(
                        color: players[index].color,
                        border: index == whoIsTurn
                            ? Border.all(color: Colors.white, width: 5)
                            : null,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> showDiceRollingAnimation() async {
    setState(() {
      diceRolling = true;
    });
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        diceRolling = false;
      });
    });
  }
}
