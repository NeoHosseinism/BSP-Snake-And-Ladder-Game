import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Player {
  final int id;
  final String name;
  final Color color;
  int homeNo;
  RxDouble x;
  RxDouble y;

  Player({
    required this.id,
    required this.name,
    required this.color,
    required this.homeNo,
    required this.x,
    required this.y,
  });
}
