import 'dart:convert';

import 'package:fayaz/models/Models.dart';
import 'package:fayaz/models/GlobalVars.dart';
import 'package:fayaz/routes/JournalRoute.dart';
import 'package:fayaz/routes/MainRoute.dart';
import 'package:fayaz/routes/MeditationRoute.dart';
import 'package:fayaz/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:prefs/prefs.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() {
  runApp(StartingPoint());

  Prefs.init().then((value) {
    String medJsonStr = Prefs.getString(Constants.meditationJson);
    List<MeditationData> medItemsList = List<MeditationData>.from(
        jsonDecode(medJsonStr).map((i) => MeditationData.fromJson(i)));
    GlobalVars.states.setMeditationDataList(medItemsList);

    String journalJsonStr = Prefs.getString(Constants.journalJson);
    List<JournalData> journalItemsList = List<JournalData>.from(
        jsonDecode(journalJsonStr).map((i) => JournalData.fromJson(i)));
    GlobalVars.states.setJournalDataList(journalItemsList);
  });
}

class StartingPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      models: [GlobalVars.states],
      builder: (context, _) => MaterialApp(
        initialRoute: "/",
        routes: {
          '/': (context) => MainRoute.getLayout(context: context),
          '/m': (context) => MeditationRoute.getLayout(context: context),
          '/j': (context) => JournalRoute.getLayout(context: context),
        },
      ),
    );
  }
}
