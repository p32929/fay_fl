import 'package:fayaz/routes/JournalRoute.dart';
import 'package:fayaz/routes/MeditationRoute.dart';
import 'package:fayaz/utils/GlobalMethods.dart';
import 'package:fayaz/widgets/Buttons.dart';
import 'package:flutter/material.dart';

class MainRoute {
  static getLayout() {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text('FAYAZ'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Buttons.getBlueButton("Meditation", () {
              GlobalMethods.changeRoute(context, MeditationRoute.getLayout());
            }),
            Buttons.getBlueButton("Journal", () {
              GlobalMethods.changeRoute(context, JournalRoute.getLayout());
            })
          ],
        )),
      ),
    );
  }
}
