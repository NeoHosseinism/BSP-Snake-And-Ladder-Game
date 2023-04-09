import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../global.dart';

class HomeCtrl extends GetxController {
  RxInt currentDiceNum = 6.obs;
  RxString userAnswer = "".obs;
  RxBool diceRolling = false.obs;

  Future<void> showDiceRollingAnimation() async {
    // setState(() {
    diceRolling.value = true;
    // });
    await Future.delayed(const Duration(milliseconds: 1700), () {
      // setState(() {
      diceRolling.value = false;
      // });
    });
  }

  Future<void> showDiceNumAndMovePlayerToken(StateSetter setState) async {
    currentDiceNum.value = Random().nextInt(6) + 1;

    if (players[whoIsTurn.value].homeNo + currentDiceNum.value < 100) {
      for (int i = 0; i < currentDiceNum.value; i++) {
        await Future.delayed(const Duration(milliseconds: 300), () {
          players[whoIsTurn.value].homeNo++;

          final int homeNo = players[whoIsTurn.value].homeNo;
          final GlobalKey homeKey = ((homeNo ~/ 10) % 2 == 1)
              ? keys[((homeNo ~/ 10) * 20) + 9 - homeNo]
              : keys[homeNo];

          players[whoIsTurn.value].x.value = getOffsetOfHome(homeKey)[0];
          players[whoIsTurn.value].y.value = getOffsetOfHome(homeKey)[1];
        });
        //! DELETE this
      }
      showQuestionDialog(setState);

      if (players[whoIsTurn.value].homeNo == 99) {
        Get.snackbar(
          "عرض تبریک",
          "${players[whoIsTurn.value].name} پیروزی شما در این نبرد تن به تن را تبریک عرض میکنیم",
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.celebration_rounded,
            color: Colors.white,
            textDirection: TextDirection.rtl,
          ),
        );
        Get.offAllNamed("/splash");
      }

      // ignore: no_leading_underscores_for_local_identifiers
      int _isStartOfSnake = isStartOfSnake(players[whoIsTurn.value].homeNo);
      // ignore: no_leading_underscores_for_local_identifiers
      int _isStartOfLadder = isStartOfLadder(players[whoIsTurn.value].homeNo);

      // ignore: no_leading_underscores_for_local_identifiers
      int _indexOfHomesArrayForSnakes =
          indexOfHomesArrayForSnakes(_isStartOfSnake);
      // ignore: no_leading_underscores_for_local_identifiers
      int _indexOfHomesArrayForLadders =
          indexOfHomesArrayForLadders(_isStartOfLadder);

      if (_isStartOfSnake != -1) {
        players[whoIsTurn.value]
          ..homeNo = _indexOfHomesArrayForSnakes
          ..x.value = getOffsetOfHome(keys[_isStartOfSnake])[0]
          ..y.value = getOffsetOfHome(keys[_isStartOfSnake])[1];
      }

      if (_isStartOfLadder != -1) {
        showQuestionDialog(setState);
        if (true) {
          players[whoIsTurn.value]
            ..homeNo = _indexOfHomesArrayForLadders
            ..x.value = getOffsetOfHome(keys[_isStartOfLadder])[0]
            ..y.value = getOffsetOfHome(keys[_isStartOfLadder])[1];
        }
      }

      int overLapperIndex = players.indexWhere((element) {
        return element.id != players[whoIsTurn.value].id &&
            // element.homeNo == destination;
            element.homeNo == players[whoIsTurn.value].homeNo;
      });
      if (overLapperIndex != -1) {
        players[overLapperIndex]
          ..homeNo = -1
          ..x.value = -1.0
          ..y.value = -1.0;

        // Get.snackbar(
        //   "عرض تسلیت",
        //   "${players[overLapperIndex].name} عزیز کشته شدنتان را تسلیت عرض میکنیم",
        //   duration: const Duration(seconds: 3),
        //   backgroundColor: Colors.red,
        //   colorText: Colors.white,
        //   icon: const Icon(
        //     Icons.warning_amber_rounded,
        //     color: Colors.white,
        //     textDirection: TextDirection.rtl,
        //   ),
        // );
      }
    }

    if (whoIsTurn.value + 1 < players.length) {
      whoIsTurn.value++;
    } else {
      whoIsTurn.value = 0;
    }
  }

  int isStartOfSnake(int homeNo) {
    //? start points of snakes show in Array
    //?  =>
    //?  =>
    //?  =>
    switch (homeNo) {
      case 66:
        return 05;
      case 82:
        return 30;
      case 91:
        return 03;
      default:
        return -1;
    }
  }

  int isStartOfLadder(int homeNo) {
    //? start points of ladders show in Array
    //?  =>
    //?  =>
    //?  =>
    switch (homeNo) {
      case 08:
        return 57;
      case 22:
        return 51;
      case 43:
        return 96;
      default:
        return -1;
    }
  }

  int indexOfHomesArrayForSnakes(int homeNo) {
    //? start points of snakes show in HomeNo
    //?  =>
    //?  =>
    //?  =>
    switch (homeNo) {
      case 05:
        return 05;
      case 30:
        return 39;
      case 03:
        return 03;
      default:
        return -1;
    }
  }

  int indexOfHomesArrayForLadders(int homeNo) {
    //? start points of ladders show in HomeNo
    //?  =>
    //?  =>
    //?  =>
    switch (homeNo) {
      case 57:
        return 52;
      case 51:
        return 58;
      case 96:
        return 93;
      default:
        return -1;
    }
  }

  Future<void> showQuestionDialog(setState) async {
    // startListening(setState);
    int rndNumber = Random().nextInt(3);

    await Get.dialog(
      QuestionBox(rndNumber),
    );
  }
}

class QuestionBox extends StatefulWidget {
  int rndNumber;
  QuestionBox(this.rndNumber, {super.key});

  @override
  State<QuestionBox> createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    List<LocaleName> locales = await _speechToText.locales();

    var selectedLocale = locales[76];

    await _speechToText.listen(
      onResult: _onSpeechResult,
      localeId: selectedLocale.localeId,
    );

    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });

    setState(() async {
      if (_lastWords ==
          questionsAndAnswers[widget.rndNumber]["Answer"].toString()) {
        Get.back();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const RadialGradient(
            radius: 0.8,
            colors: [
              Color(0xFF772F1A),
              Color.fromARGB(255, 62, 39, 35),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "نردبان ریاضی",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 14,
                fontFamily: "IRANSansXFaNum-Medium",
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "« ${questionsAndAnswers[widget.rndNumber]["Question"].toString()} »",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      ": حاصل عبارت مقابل را بیان کنید",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                FloatingActionButton(
                  onPressed:
                      // If not yet listening for speech start, otherwise stop
                      _speechToText.isNotListening
                          ? _startListening
                          : _stopListening,
                  tooltip: 'Listen',
                  backgroundColor: Colors.amber[800],
                  child: Icon(
                      _speechToText.isNotListening ? Icons.mic_off : Icons.mic),
                ),
                // const SizedBox(height: 30),
                if (_speechToText.isListening)
                  Container(
                    color: Colors.black45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          color: Colors.red,
                          child: SizedBox(
                            width: 50,
                            child: Lottie.network(
                                "https://assets9.lottiefiles.com/packages/lf20_vaWAER.json"),
                          ),
                        ),
                        Container(
                          color: Colors.blue,
                          child: const Text(
                            "در حال گوش دادن",
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 14,
                              fontFamily: "IRANSansXFaNum-Medium",
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 15),
                Text(
                  _lastWords,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 14, color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 15),
            MaterialButton(
              minWidth: double.infinity,
              color: Colors.brown,
              textColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                Get.back();
              },
              child: const Text('بازگشت'),
            ),
          ],
        ),
      ),
    );
  }
}
