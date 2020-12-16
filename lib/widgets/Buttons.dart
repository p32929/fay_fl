import 'package:flutter/material.dart';

class Buttons {
  static getBlueButton(String text, Function onClick) {
    return RaisedButton(
      color: Color(0xFF4CAF50),
      onPressed: onClick,
      child: Text(
        text,
        style: TextStyle(color: Color(0xFFFFFFFF)),
      ),
    );
  }
}
