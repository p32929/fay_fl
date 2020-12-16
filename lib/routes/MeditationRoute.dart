import 'package:fayaz/models/Models.dart';
import 'package:fayaz/models/StatesHolder.dart';
import 'package:flutter/material.dart';

class MeditationRoute {
  static getLayout() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meditation"),
        actions: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
        },
        child: Icon(Icons.add),
      ),
    );
  }

  static getItemLayout() {
    return ListTile(
      title: Text("Title"),
      subtitle: Text("Subtitle"),
      leading: Icon(Icons.reorder),
      trailing: Icon(Icons.delete_forever),
    );
  }
}
