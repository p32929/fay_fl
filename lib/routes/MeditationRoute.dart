import 'package:fayaz/models/Models.dart';
import 'package:fayaz/models/StatesHolder.dart';
import 'package:fayaz/utils/GlobalVars.dart';
import 'package:flutter/material.dart';

class MeditationRoute {
  static getLayout({BuildContext context}) {
    GlobalVars.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Meditation"),
        actions: [],
      ),
      body: Text("${StatesHolder.states.counter}"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          StatesHolder.states.increase();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  static _getItemLayout() {
    return ListTile(
      title: Text("Title"),
      subtitle: Text("Subtitle"),
      leading: Icon(Icons.reorder),
      trailing: Icon(Icons.delete_forever),
    );
  }
}
