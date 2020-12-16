import 'package:fayaz/models/Models.dart';
import 'package:flutter/cupertino.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class States extends StatesRebuilder {
  List<MeditationData> meditationData = [];
  List<JournalData> journalData = [];

  setMeditationDataList(List<MeditationData> meditationData) {
    //
  }

  setJournalDataList(List<JournalData> journalData) {
    //
  }
}

class StatesHolder {
  static States states = States();
}
