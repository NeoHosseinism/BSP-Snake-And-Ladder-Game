import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snake_and_ladder/global.dart';

class HomeCtrl extends GetxController {
  RxInt currentDiceNum = 6.obs;

  // @override
  // void onInit() async {
  //   for (int i = 0; i < 100; i++) {
  //     homesOffset[i] = [
  //       getOffsetOfHome(keys[i])[0],
  //       getOffsetOfHome(keys[i])[1]
  //     ];
  //     print(i.toString());
  //     // print("${homesOffset[i].dx.toString()}, ${homesOffset[i].dx.toString()}");
  //   }
  //   super.onInit();
  // }

  Future<void> diceRoll(StateSetter setState) async {
    currentDiceNum.value = Random().nextInt(6) + 1;

    // TODO: check not over flow of 100
    // TODO: 10 => 11
    // TODO: should be make 6 to come in
    for (int i = 0; i < currentDiceNum.value; i++) {
      await Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          players[whoIsTurn].homeNo++;
          players[whoIsTurn].x.value =
              getOffsetOfHome(keys[players[whoIsTurn].homeNo])[0];
          players[whoIsTurn].y.value =
              getOffsetOfHome(keys[players[whoIsTurn].homeNo])[1];
        });
      });
    }

    if (whoIsTurn + 1 < players.length) {
      whoIsTurn++;
    } else {
      whoIsTurn = 0;
    }
  }
}
