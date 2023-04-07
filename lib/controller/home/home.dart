import 'dart:math';

import 'package:get/get.dart';

import '../../global.dart';

class HomeCtrl extends GetxController {
  RxInt currentDiceNum = 6.obs;
  Future<void> showDiceNumAndMovePlayerToken() async {
    // TODO: check not over flow of 100
    // TODO: 10 => 11
    // TODO: should be make 6 to come in
    // TODO: a player can die another player

    currentDiceNum.value = Random().nextInt(6) + 1;

    for (int i = 0; i < currentDiceNum.value; i++) {
      await Future.delayed(const Duration(milliseconds: 300), () {
        players[whoIsTurn].homeNo++;
        players[whoIsTurn].x.value =
            getOffsetOfHome(keys[players[whoIsTurn].homeNo])[0];
        players[whoIsTurn].y.value =
            getOffsetOfHome(keys[players[whoIsTurn].homeNo])[1];
      });
    }

    if (whoIsTurn + 1 < players.length) {
      whoIsTurn++;
    } else {
      whoIsTurn = 0;
    }
  }
}
