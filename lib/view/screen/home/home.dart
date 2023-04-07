import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snake_and_ladder/global.dart';

import 'widget/board/board.dart';
import 'widget/board/snakes_and_ladders.dart';
import 'widget/dice/dice_and_who_turn_box.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          radius: 0.8,
          colors: [
            Color(0xFF772F1A),
            Color.fromARGB(255, 62, 39, 35),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Board(),
                SizedBox(height: 50),
                DiceAndWhoTurnBox(),
              ],
            ),
            const SnakesAndLadders(),
            Obx(
              () => Stack(
                children: List.generate(
                  players.length,
                  (index) {
                    if (players[index].x.value + players[index].y.value ==
                        -2.0) {
                      return Container();
                    } else {
                      return Positioned(
                        left: players[index].x.value + halfOfAHomeWidth / 2,
                        top: players[index].y.value + halfOfAHomeWidth / 2,
                        child: Container(
                          height: halfOfAHomeWidth.value,
                          width: halfOfAHomeWidth.value,
                          decoration: BoxDecoration(
                              color: players[index].color,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
