import 'package:flutter/material.dart';
import 'package:yo_event/Accounts/view_account.dart';
import 'package:yo_event/Views/Event_page.dart';
import 'package:yo_event/Views/cart_page.dart';
import 'package:yo_event/Views/chat.dart';

class Navigation_Bar extends StatefulWidget {
  @override
  State<Navigation_Bar> createState() => _Navigation_BarState();
}

class _Navigation_BarState extends State<Navigation_Bar> {
  // const Navigation_Bar({super.key});
  List pages = [
    EventSite(),
    CartSection(),
    ChatSection(),
    ViewAccount(),
  ];
  int currentPage = 0;

  void onTap(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentPage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blueGrey[200],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.blueGrey,
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ]),
    );
  }
}
