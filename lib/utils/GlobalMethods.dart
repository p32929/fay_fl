import 'package:fayaz/models/GlobalVars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      //
    }
  }
}
