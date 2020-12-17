import 'package:fayaz/models/GlobalVars.dart';
import 'package:fayaz/models/Models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalMethods {
  static void changeRoute(context, String route) {
    Navigator.pushNamed(context, route);
  }

  static playAudio({int index}) {
    if (GlobalVars.states.currentMeditationTrack > -1) {
      GlobalVars.audioPlayer.stop().then((value) {
        GlobalVars.states.setCurrentMeditationTrack(-1);
      });
    } else {
      GlobalVars.audioPlayer
          .play(GlobalVars.states.meditationDataList[0].path)
          .then((value) {
        GlobalVars.states.setCurrentMeditationTrack(0);
      });

      GlobalVars.audioPlayer.onPlayerCompletion.listen((event) {
        print("PC - ${GlobalVars.states.currentMeditationTrack}");
        int next = GlobalVars.states.currentMeditationTrack + 1;
        if (next >= GlobalVars.states.meditationDataList.length) {
          GlobalVars.audioPlayer.stop().then((value) {
            GlobalVars.states.setCurrentMeditationTrack(-1);
          });
        } else {
          print("PC - Next - $next");
          GlobalVars.audioPlayer
              .play(GlobalVars.states.meditationDataList[next].path)
              .then((value) {
            GlobalVars.states.setCurrentMeditationTrack(next);
          });
        }
      });
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
