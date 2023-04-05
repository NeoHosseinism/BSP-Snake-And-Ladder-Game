import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
