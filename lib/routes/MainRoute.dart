import 'package:fayaz/models/StatesHolder.dart';
import 'package:fayaz/utils/GlobalMethods.dart';
import 'package:fayaz/utils/GlobalVars.dart';
import 'package:fayaz/widgets/Buttons.dart';
import 'package:flutter/material.dart';

class MainRoute {
  static getLayout({BuildContext context}) {
    GlobalVars.context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text('FAYAZ'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("HAHA ${StatesHolder.states.counter}"),
          Buttons.getBlueButton("Meditation", () {
            //
            GlobalMethods.changeRoute(context, '/m');
          }),
          Buttons.getBlueButton("Journal", () {
            //
            GlobalMethods.changeRoute(context, '/j');
          })
        ],
      )),
    );
  }
}
