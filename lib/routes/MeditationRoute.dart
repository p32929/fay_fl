import 'dart:io';

import 'package:fayaz/models/Models.dart';
import 'package:fayaz/models/StatesHolder.dart';
import 'package:fayaz/utils/GlobalVars.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

int count = 0;

class MeditationRoute {
  static getLayout({BuildContext context}) {
    GlobalVars.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Meditation"),
        actions: [
          IconButton(
              icon: Icon(
                StatesHolder.states.isPlayingMeditation
                    ? Icons.play_arrow
                    : Icons.stop,
              ),
              onPressed: () {
                //
              }),
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                //
              }),
        ],
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
        onPressed: () async {
          try {
            List<File> files = await FilePicker.getMultiFile(
              type: FileType.audio,
            );
            StatesHolder.states.setMeditationDataList(files.map((e) {
              String path = e.uri.toFilePath();
              return MeditationData(path, false);
            }).toList());
          } catch (e) {
            //
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  static _getItemLayout(int index) {
    MeditationData item = StatesHolder.states.meditationDataList[index];
    List<String> splittedParts = item.path.split("/");

    return ListTile(
      key: Key(index.toString()),
      title: Text(splittedParts[splittedParts.length - 1]),
      subtitle: Text(item.path),
      leading: Icon(item.isPlaying ? Icons.play_arrow : Icons.stop),
      trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () {
            StatesHolder.states.deleteMeditationFromList(index);
          }),
    );
  }
}
