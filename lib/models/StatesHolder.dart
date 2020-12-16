import 'package:fayaz/models/Models.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class States extends StatesRebuilder {
  String route = "/";
  int counter = 0;
  List<MeditationData> meditationDataList = [];
  List<JournalData> journalDataList = [];

  void setRoute(String route) {
    this.route = route;
    rebuildStates();
  }

  void increase() {
    this.counter++;
    rebuildStates();
  }

  setMeditationDataList(List<MeditationData> meditationDataList) {
    this.meditationDataList = meditationDataList;
    rebuildStates();
  }

  addMeditationDataToList(MeditationData meditationData) {
    this.meditationDataList.add(meditationData);
    rebuildStates();
  }

  deleteMeditationFromList(int index) {
    this.meditationDataList.removeAt(index);
    rebuildStates();
  }

  setJournalDataList(List<JournalData> journalDataList) {
    this.journalDataList = journalDataList;
    rebuildStates();
  }

  addJournalDataToList(JournalData journalData) {
    rebuildStates();
  }

  deleteJournalFromList(int index) {
    this.journalDataList.removeAt(index);
    rebuildStates();
  }
}

class StatesHolder {
  static States states = States();
}
