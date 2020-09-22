import 'package:flutter/material.dart';

class MyColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFF707070);
  static const Color grayLight = Color(0xFFA8A8A8);
  static const Color blue = Color(0xFF3F78E7);
  static const Color purple = Color(0xFF70039C);
  static const Color purpleLight = Color(0xFF9668C9);
  static const gradientPurpleBlue = [purple, blue];
}

Map<int, Color> color = {
  50: Color.fromRGBO(112, 3, 156, .1),
  100: Color.fromRGBO(112, 3, 156, .2),
  200: Color.fromRGBO(112, 3, 156, .3),
  300: Color.fromRGBO(112, 3, 156, .4),
  400: Color.fromRGBO(112, 3, 156, .5),
  500: Color.fromRGBO(112, 3, 156, .6),
  600: Color.fromRGBO(112, 3, 156, .7),
  700: Color.fromRGBO(112, 3, 156, .8),
  800: Color.fromRGBO(112, 3, 156, .9),
  900: Color.fromRGBO(112, 3, 156, 1),
};
