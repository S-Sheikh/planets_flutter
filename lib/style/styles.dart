import 'package:flutter/material.dart';

class Styles {
  static final baseTextStyle = const TextStyle(
    fontFamily: 'Poppins',
  );
  static final headerTextStyle = baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600 
  );
  static final regularTextStyle = baseTextStyle.copyWith(
    color: Color(0xFFB6B2DF),
    fontSize: 9.0,
    fontWeight: FontWeight.w400
  );
  static final subHeaderTextStyle = baseTextStyle.copyWith(
    color: Colors.white24,
    fontSize: 12.0
  );
}