import 'package:flutter/material.dart';

class RecognizedWords extends StatelessWidget {
  final String words;
  const RecognizedWords(this.words, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        words,
        textAlign: TextAlign.right,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
