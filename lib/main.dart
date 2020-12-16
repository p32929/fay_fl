import 'package:fayaz/models/StatesHolder.dart';
import 'package:fayaz/routes/MainRoute.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() {
  runApp(StartingPoint());
}

class StartingPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StateBuilder(
      models: [StatesHolder.states],
      builder: (context, _) => MaterialApp(
        home: MainRoute.getLayout(),
      ),
    );
  }
}
