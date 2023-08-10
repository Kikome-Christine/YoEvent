import 'package:flutter/material.dart';
import 'package:real_event/views/bottom_nav_bar/bottom_bar_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        color: Colors.white70,
        height: 550,
        padding: EdgeInsets.only(left: 10, top: 100, right: 10, bottom: 20),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 30,
                padding: const EdgeInsets.all(8),
                color: Colors.teal[700],
                child: Center(child: const Text("E-Ticketing")),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 30,
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: Center(child: const Text('Catering Services')),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                child: Container(
                  height: 30,
                  padding: const EdgeInsets.all(8),
                  color: Colors.teal[500],
                  child: Center(child: const Text('Sound Systems')),
                ),
                onTap: () {},
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 30,
                padding: const EdgeInsets.all(8),
                color: Colors.teal[100],
                child: Center(child: const Text('Venues')),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 30,
                padding: const EdgeInsets.all(8),
                color: Colors.teal[600],
                child: Center(child: const Text('Decorations')),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 30,
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: Center(child: const Text('Chairs and Tents')),
              ),
            ),
          ],
        ),
      ),
      BottomBarView(),
    ]);
  }
}
