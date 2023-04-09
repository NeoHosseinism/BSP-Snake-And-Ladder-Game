import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snake_and_ladder/global.dart';

class TokensOutOfGame extends StatelessWidget {
  const TokensOutOfGame({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      alignment: Alignment.center,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(players.length, (index) {
            if (players[index].x.value == -1 && players[index].y.value == -1) {
              return playerToken(index);
            } else {
              return Container();
            }
          }),
        ),
      ),
    );
  }

  Container playerToken(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: players[index].color,
          strokeAlign: BorderSide.strokeAlignOutside,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(15),
        // boxShadow: [
        //   BoxShadow(
        //     blurRadius: 10,
        //     spreadRadius: 6,
        //     color: players[index].color,
        //   ),
        // ],
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
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          Icons.hotel_class_rounded,
          color: Colors.white,
          size: halfOfAHomeWidth.value / 1.25,
        ),
      ),
    );
  }
}
