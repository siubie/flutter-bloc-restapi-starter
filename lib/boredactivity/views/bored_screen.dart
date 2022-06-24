import 'package:flutter/material.dart';

class BoredActivityScreen extends StatelessWidget {
  static const String Route = '/bored';
  const BoredActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bored Screen"),
      ),
    );
  }
}
