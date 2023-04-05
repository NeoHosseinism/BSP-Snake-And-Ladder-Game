import 'package:flutter/material.dart';

class DiceDot extends StatelessWidget {
  final Alignment alignment;

  const DiceDot({super.key, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black54,
            ],
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
