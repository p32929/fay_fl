import 'dart:convert';
import 'dart:io';

import 'package:fayaz/models/Models.dart';
import 'package:fayaz/models/GlobalVars.dart';
import 'package:fayaz/utils/Constants.dart';
import 'package:fayaz/utils/GlobalMethods.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:prefs/prefs.dart';

int count = 0;

class MeditationRoute {
  static getLayout({BuildContext context}) {
    Constants.context = context;

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          child: Text("Meditation"),
          // onTap: () {
          //   //
          // },
          onLongPress: () {
            String json = jsonEncode(GlobalVars.states.meditationDataList);
            Prefs.setString(Constants.meditationJson, json);

            GlobalMethods.showAlertDialog(
              "Success",
              "JSON saved",
            );
          },
        ),
        actions: GlobalVars.states.meditationDataList.length > 0
            ? [
                IconButton(
                    icon: Icon(
                      GlobalVars.states.currentMeditationTrack > -1
                          ? Icons.stop
                          : Icons.play_arrow,
                    ),
                    onPressed: () {
                      GlobalMethods.playAudio();
                    }),
              ]
            : [],
      ),
      body: ReorderableListView(
        children: List<Widget>.generate(
          GlobalVars.states.meditationDataList.length,
          (index) => _getItemLayout(index),
        ),
        onReorder: (int o, int n) {
          GlobalVars.states.reorderMeditationData(o, n);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            List<File> files = await FilePicker.getMultiFile(
              type: FileType.audio,
            );
            List<MeditationData> meditationData = files.map((e) {
              String path = e.uri.toFilePath();
              return MeditationData(path: path);
            }).toList();

            meditationData.sort((a, b) => a.path.compareTo(b.path));
            GlobalVars.states.setMeditationDataList(meditationData);
          } catch (e) {
            //
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  static _getItemLayout(int index) {
    MeditationData item = GlobalVars.states.meditationDataList[index];
    List<String> splittedParts = item.path.split("/");

    return Card(
      key: Key(index.toString()),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          title: Text(splittedParts[splittedParts.length - 1]),
          subtitle: Text(item.path),
          leading: Icon(GlobalVars.states.currentMeditationTrack == index
              ? Icons.stop
              : Icons.play_arrow),
          trailing: IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                GlobalVars.states.deleteMeditationFromList(index);
              }),
        ),
      ),
    );
  }
}
