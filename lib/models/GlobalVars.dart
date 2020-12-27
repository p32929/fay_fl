import 'package:audioplayers/audioplayers.dart';
import 'package:fayaz/models/Models.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class StatesManager extends StatesRebuilder {
  List<MeditationData> meditationDataList = [];
  List<JournalData> journalDataList = [];
  int currentMeditationTrack = -1;

  reorderMeditationData(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final MeditationData item = this.meditationDataList.removeAt(oldIndex);
    this.meditationDataList.insert(newIndex, item);
    rebuildStates();
  }

  reorderJournalData(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final JournalData item = this.journalDataList.removeAt(oldIndex);
    this.journalDataList.insert(newIndex, item);
    rebuildStates();
  }

  setTodayTextFor(int index, String today) {
    this.journalDataList[index].today = today;
    rebuildStates();
  }

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

  addJournalDataToList(String data) {
    List<String> journals = data.split(",");
    for (int i = 0; i < journals.length; i++) {
      if (journals[i].replaceAll(" ", "").isNotEmpty)
        this.journalDataList.add(JournalData(name: journals[i].trim()));
    }
    rebuildStates();
  }

  deleteJournalFromList(int index) {
    this.journalDataList.removeAt(index);
    rebuildStates();
  }
}

class GlobalVars {
  static StatesManager states = StatesManager();
  static AudioPlayer audioPlayer = new AudioPlayer();
}
