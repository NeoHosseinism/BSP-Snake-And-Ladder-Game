import 'dart:math';

import 'package:get/get.dart';
import 'package:snake_and_ladder/global.dart';

class HomeCtrl extends GetxController {
  RxInt currentDiceNum = 6.obs;

  void diceRoll() {
    currentDiceNum.value = Random().nextInt(6) + 1;

    // TODO: move the players token

    if (whoIsTurn + 1 < players.length) {
      whoIsTurn++;
    } else {
      whoIsTurn = 0;
    }
  }
}
