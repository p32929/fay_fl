import 'dart:convert';

import 'package:fayaz/models/StatesHolder.dart';
import 'package:fayaz/utils/GlobalVars.dart';
import 'package:flutter/material.dart';
import 'package:prefs/prefs.dart';

class JournalRoute {
  static getLayout({BuildContext context}) {
    GlobalVars.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Journal"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Prefs.setString(GlobalVars.journalJson,
                    jsonEncode(StatesHolder.states.journalDataList));
              }),
        ],
      ),
      body: Text("Journal"),
    );
  }
}
