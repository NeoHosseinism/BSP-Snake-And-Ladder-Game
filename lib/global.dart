import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'model/player/player.dart';

List<RxBool> checkBoxs = List.generate(4, (index) => true.obs);
List<Player> players = [];
RxInt whoIsTurn = 0.obs;
RxDouble halfOfAHomeWidth = (0.0).obs;

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

const List<Map<String, String>> questionsAndAnswers = [
  {
    "Question": "2 + 1",
    "Answer": "3",
  },
  {
    "Question": "5 + 35",
    "Answer": "40",
  },
  {
    "Question": "2 + 3",
    "Answer": "5",
  }
];

RxString lastSayedWords = ''.obs;
RxBool isSpeeching = false.obs;
