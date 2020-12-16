import 'package:fayaz/models/Models.dart';
import 'package:fayaz/models/StatesHolder.dart';
import 'package:fayaz/utils/GlobalVars.dart';
import 'package:flutter/material.dart';

int count = 0;

class MeditationRoute {
  static getLayout({BuildContext context}) {
    GlobalVars.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Meditation"),
        actions: [],
      ),
      body: ReorderableListView(
        children: List<Widget>.generate(
          StatesHolder.states.meditationDataList.length,
          (index) => _getItemLayout(index),
        ),
        onReorder: (o, n) {
          //
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          StatesHolder.states.addMeditationDataToList(
              MeditationData("HAHAHA ${count++}", false));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  static _getItemLayout(int index) {
    return ListTile(
      key: Key(index.toString()),
      title: Text("Title"),
      subtitle: Text("Subtitle"),
      leading: Icon(Icons.play_arrow),
      trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () {
            //
          }),
    );
  }
}
