import 'package:flutter/material.dart';

class PhoneSize {
  static double phoneWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static double phoneHeight(context) {
    return MediaQuery.of(context).size.height;
  }
}
