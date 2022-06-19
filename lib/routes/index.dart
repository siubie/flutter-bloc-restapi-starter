import 'package:flutter/material.dart';
import 'package:mystarter/boredactivity/views/bored_screen.dart';

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => BoredActivityScreen());
    default:
      return MaterialPageRoute(builder: (_) => BoredActivityScreen());
  }
}
