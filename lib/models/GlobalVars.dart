import 'package:fayaz/models/Models.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class StatesManager extends StatesRebuilder {
  List<MeditationData> meditationDataList = [];
  List<JournalData> journalDataList = [];
  int currentMeditationTrack = -1;

  setCurrentMeditationTrack(int trackIndex) {
    this.currentMeditationTrack = trackIndex;
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
    this.journalDataList.add(journalData);
    rebuildStates();
  }

  deleteJournalFromList(int index) {
    this.journalDataList.removeAt(index);
    rebuildStates();
  }
}

class GlobalVars {
  static StatesManager states = StatesManager();
}
