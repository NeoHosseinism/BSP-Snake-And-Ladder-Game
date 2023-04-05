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
            const Align(
              alignment: Alignment(0, 0.5),
              child: Text(
                "استاد راهنما : جناب آقای دکتر امیری",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Lottie.asset(
                  'assets/gifs/lf20_tsxbtrcu.json',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
