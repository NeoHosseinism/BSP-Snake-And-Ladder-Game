import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/player/player.dart';

int diceAnimationDuration = 0;
int currentDiceNum = 6;
List<RxBool> checkBoxs = List.generate(4, (index) => false.obs);
List<Player> players = [];

const List<Color> playerTokenColors = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.lime,
];

final List<GlobalKey> keys = List.generate(100, (index) => GlobalKey());
List<double> getOffsetOfHome(GlobalKey key) {
  final RenderBox renderBox =
      key.currentContext!.findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  return [position.dx, position.dy];
}