import 'dart:convert';
import 'package:fayaz/models/Models.dart';
import 'package:fayaz/models/GlobalVars.dart';
import 'package:fayaz/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:prefs/prefs.dart';

class JournalRoute {
  static getLayout({BuildContext context}) {
    Constants.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Journal"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                String json = jsonEncode(GlobalVars.states.journalDataList);
                Prefs.setString(Constants.journalJson, json);
              }),
        ],
      ),
      body: ListView.builder(
        itemCount: GlobalVars.states.journalDataList.length,
        itemBuilder: (ctx, index) => _getItemLayout(index),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          GlobalVars.states
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
            GlobalVars.states.deleteJournalFromList(index);
          }),
    );
  }
}
