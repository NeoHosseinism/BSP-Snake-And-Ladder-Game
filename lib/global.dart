import 'package:flutter/material.dart';

late int numOfPlayers;
late final List<String> playersName;
int diceAnimationDuration = 0;
int currentDiceNum = 6;

final List<GlobalKey> keys = List.generate(100, (index) => GlobalKey());
List<double> getOffsetOfHome(GlobalKey key) {
  final RenderBox renderBox =
      key.currentContext!.findRenderObject() as RenderBox;
  final position = renderBox.localToGlobal(Offset.zero);
  return [position.dx, position.dy];
}
