import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalMethods {
  static void changeRoute(context, route) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => route,
      ),
    );
  }
}
