import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalMethods {
  static void changeRoute(context, String route) {
    Navigator.pushNamed(context, route);
  }
}
