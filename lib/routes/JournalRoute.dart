import 'dart:convert';
import 'package:fayaz/models/Models.dart';
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
                String json = jsonEncode(StatesHolder.states.journalDataList);
                Prefs.setString(GlobalVars.journalJson, json);
              }),
        ],
      ),
      body: ListView.builder(
        itemCount: StatesHolder.states.journalDataList.length,
        itemBuilder: (ctx, index) => _getItemLayout(index),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          StatesHolder.states
              .addJournalDataToList(JournalData(name: "HAHA", today: "HOHO"));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  static _getItemLayout(int index) {
    return ListTile(
      title: Text('HELLO'),
      subtitle: Text('HAHAHA'),
      leading: Icon(Icons.play_arrow),
      trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () {
            StatesHolder.states.deleteJournalFromList(index);
          }),
    );
  }
}
