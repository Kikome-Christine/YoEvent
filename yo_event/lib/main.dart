import 'package:flutter/material.dart';

import 'package:yo_event/views/splash_screen.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: splashpage(),
      ),
    );
  }
}
