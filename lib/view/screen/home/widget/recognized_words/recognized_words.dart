import 'package:flutter/material.dart';

class RecognizedWords extends StatelessWidget {
  final String words;
  const RecognizedWords(this.words, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      words,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }
}
