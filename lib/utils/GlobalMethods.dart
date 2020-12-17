import 'package:fayaz/models/GlobalVars.dart';
import 'package:fayaz/models/Models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalMethods {
  static void changeRoute(context, String route) {
    Navigator.pushNamed(context, route);
  }

  static playNextAudio() {
    try {
      GlobalVars.states.setCurrentMeditationTrack(
          GlobalVars.states.currentMeditationTrack + 1);

      GlobalVars.audioPlayer.play(
        GlobalVars.states
            .meditationDataList[GlobalVars.states.currentMeditationTrack].path,
        isLocal: true,
        stayAwake: true,
      );
    } catch (e) {
      GlobalVars.states.setCurrentMeditationTrack(-1);
    }
  }

  static copyJournalToClipboard() {
    List<JournalData> journalDataList = GlobalVars.states.journalDataList;
    String journalText = "";
    for (int i = 0; i < journalDataList.length; i++) {
      if (journalDataList[i].today != null) {
        journalText +=
            journalDataList[i].name + ": " + journalDataList[i].today + "\n";
      }
    }
    Clipboard.setData(ClipboardData(text: journalText));
  }
}
