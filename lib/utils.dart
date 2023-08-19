import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'model/player/player.dart';

List<RxBool> checkBoxs = List.generate(4, (index) => false.obs);
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
    "Question": "جواب سلام چیست ؟",
    "Answer": "سلام",
  },
  {
    "Question": "بگو ایران",
    "Answer": "ایران",
  },
  {
    "Question": "بگو دمت گرم",
    "Answer": "دمت گرم",
  }
];

RxString lastSayedWords = ''.obs;
RxBool isSpeeching = false.obs;
RxBool isAnsCorrect = false.obs;
