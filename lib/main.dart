import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/screen/home/home.dart';
import 'view/screen/splash/splash.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Snake and Ladder',
      // locale: const Locale("fa", "IR"),
      theme: ThemeData(fontFamily: "IRANSansXFaNum-Medium"),
      debugShowCheckedModeBanner: false,
      // home: const Splash(),
      initialRoute: "/splash",
      getPages: [
        GetPage(name: "/splash", page: () => const Splash()),
        GetPage(name: "/home", page: () => const Home()),
      ],
    );
  }
}