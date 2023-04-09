import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:snake_and_ladder/controller/home/home.dart';

import '../../../../../global.dart';
import 'dice.dart';

final HomeCtrl homeCtrl = Get.put(HomeCtrl());

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
        Obx(
          () => SizedBox(
            height: 100,
            width: 100,
            child: (homeCtrl.diceRolling.value)
                ? Center(
                    child: Lottie.asset(
                      "assets/gifs/131706-dice-6.json",
                      height: 100,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(12),
                    child: Dice(
                      homeCtrl.currentDiceNum.value,
                    ),
                  ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await homeCtrl.showDiceRollingAnimation();
            await homeCtrl.showDiceNumAndMovePlayerToken(setState);
          },
          child: Obx(
            () => Column(
              children: [
                Text(
                  "نوبت : ${players[whoIsTurn.value].name}",
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
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: players[index].color,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: index == whoIsTurn.value
                              ? [
                                  BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 10,
                                    color: players[index].color,
                                  ),
                                ]
                              : [],
                        ),
                        child: Container(
                          height: halfOfAHomeWidth.value * 1.125,
                          width: halfOfAHomeWidth.value * 1.125,
                          decoration: BoxDecoration(
                            color: players[index].color,
                            border: Border.all(
                              color: Colors.white,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
