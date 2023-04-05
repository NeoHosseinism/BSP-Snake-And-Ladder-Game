import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/splash/splash.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final SplashCtrl splashController = Get.put(SplashCtrl());

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
            const Center(
              child: Text(
                "مار پله",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: FittedBox(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Lottie.asset(
                      'assets/gifs/dice_rolling.json',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
