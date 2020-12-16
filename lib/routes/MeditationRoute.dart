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
              MeditationData("HAHAHA ${count++}", count % 2 == 0));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  static _getItemLayout(int index) {
    MeditationData item = StatesHolder.states.meditationDataList[index];

    return ListTile(
      key: Key(index.toString()),
      title: Text(item.path),
      subtitle: Text(item.path),
      leading: Icon(item.isPlaying ? Icons.play_arrow : Icons.stop),
      trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () {
            //
          }),
    );
  }
}
