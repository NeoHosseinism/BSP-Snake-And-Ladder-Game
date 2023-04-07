import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../global.dart';

class HomeCtrl extends GetxController {
  RxInt currentDiceNum = 6.obs;
  Future<void> showDiceNumAndMovePlayerToken() async {
    // TODO: 10 => 11

    currentDiceNum.value = Random().nextInt(6) + 1;

    for (int i = 0; i < currentDiceNum.value; i++) {
      await Future.delayed(const Duration(milliseconds: 300), () {
        players[whoIsTurn.value].homeNo++;

        final int homeNo = players[whoIsTurn.value].homeNo;
        final GlobalKey homeKey = ((homeNo ~/ 10) % 2 == 1)
            ? keys[((homeNo ~/ 10) * 20) + 9 - homeNo]
            : keys[homeNo];

        players[whoIsTurn.value].x.value = getOffsetOfHome(homeKey)[0];
        players[whoIsTurn.value].y.value = getOffsetOfHome(homeKey)[1];
        // players[whoIsTurn.value].x.value =
        //     getOffsetOfHome(keys[players[whoIsTurn.value].homeNo])[0];
        // players[whoIsTurn.value].y.value =
        //     getOffsetOfHome(keys[players[whoIsTurn.value].homeNo])[1];
      });
    }

    // TODO: check not over flow of 100

    int overLapperIndex = players.indexWhere((element) {
      return element.name != players[whoIsTurn.value].name &&
          // element.homeNo == destination;
          element.homeNo == players[whoIsTurn.value].homeNo;
    });
    if (overLapperIndex != -1) {
      players[overLapperIndex]
        ..homeNo = -1
        ..x.value = -1.0
        ..y.value = -1.0;
    }

    if (whoIsTurn.value + 1 < players.length) {
      whoIsTurn.value++;
    } else {
      whoIsTurn.value = 0;
    }
  }
}
