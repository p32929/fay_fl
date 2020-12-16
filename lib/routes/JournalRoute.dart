import 'package:fayaz/utils/GlobalVars.dart';
import 'package:flutter/material.dart';

class JournalRoute {
  static getLayout({BuildContext context}) {
    GlobalVars.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Journal"),
      ),
      body: Text("Journal"),
    );
  }
}
