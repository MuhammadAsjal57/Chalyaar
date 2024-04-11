import 'package:flutter/material.dart';

class ColorConstant{
  
  static Color red700 = fromHex('#d9282e');

  static Color orange = fromHex('#dc7726');
  static Color amber = fromHex('#ecc046');
  
  static Color white=Colors.white;
  static Color customWhite=fromHex('#f5f7ed');
  static Color tiffanyBlue=fromHex('#42c0d2');
  
  static Color googleColor=fromHex('#34A853');
  static Color lightWhiteGrey=const Color.fromARGB(255, 219, 206, 206);
  static Color black=Colors.black;


  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}