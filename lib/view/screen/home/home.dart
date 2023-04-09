import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snake_and_ladder/global.dart';
import 'package:snake_and_ladder/view/screen/home/widget/recognized_words/recognized_words.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'widget/board/board.dart';
import 'widget/board/snakes_and_ladders.dart';
import 'widget/dice/dice_and_who_turn_box.dart';
import 'widget/tokens_out_of_game/tokens_out_of_game.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
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
      if (_lastWords == "تاس بریز") {
        await homeCtrl.showDiceRollingAnimation();
        await homeCtrl.showDiceNumAndMovePlayerToken(setState);
      }
    });
  }

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 90),
                const DiceAndWhoTurnBox(),
                const Board(),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 60,
                  child: Center(child: TokensOutOfGame()),
                ),
                const Spacer(),
                RecognizedWords(_lastWords),
                const Spacer(),
                const Spacer(),
                const Spacer(),
              ],
            ),
            const SnakesAndLadders(),
            Obx(
              () => Stack(
                children: List.generate(
                  players.length,
                  (index) {
                    if (players[index].x.value + players[index].y.value ==
                        -2.0) {
                      return Container();
                    } else {
                      return Positioned(
                        left: players[index].x.value +
                            halfOfAHomeWidth * 0.875 / 2,
                        top: players[index].y.value +
                            halfOfAHomeWidth * 0.875 / 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: players[index].color,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 6,
                                color: players[index].color,
                              ),
                            ],
                          ),
                          child: Container(
                            height: halfOfAHomeWidth.value * 1.125,
                            width: halfOfAHomeWidth.value * 1.125,
                            decoration: BoxDecoration(
                              color: players[index].color,
                              border: Border.all(
                                color: Colors.white,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Icon(
                              Icons.hotel_class_rounded,
                              color: Colors.white,
                              size: halfOfAHomeWidth.value / 1.25,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 6),
          child: FloatingActionButton(
            onPressed:
                // If not yet listening for speech start, otherwise stop
                _speechToText.isNotListening ? _startListening : _stopListening,
            tooltip: 'Listen',
            backgroundColor: Colors.amber[800],
            child:
                Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
          ),
        ),
      ),
    );
  }
}
