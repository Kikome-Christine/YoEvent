// import 'package:fluentui_icons/fluentui_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:real_event/views/chat/chat_room_screen.dart';
// import 'package:real_event/views/home/home_screen.dart';
// import 'package:real_event/views/profile/add_profile.dart';

// class Navigation_Bar extends StatefulWidget {
//   const Navigation_Bar({Key? key}) : super(key: key);
//   @override
//   State<Navigation_Bar> createState() => _Navigation_BarState();
// }

// class _Navigation_BarState extends State<Navigation_Bar> {
//   int selectedItems = 0;

//   // ignore: non_constant_identifier_names
//   static final List<Widget> _WidgetOptions = <Widget>[
//     HomeScreen(),
//     // const ChatSection(),
//     // const CartSection(),
//     const ProfileScreen(),
//     // CreateEventView()

//     // AdvertForm()
//     // AdvertisementForm(),
//     const ChatSection(),
//     // const CreateEventSection()
//   ];

//   void _tappeditem(int index) {
//     setState(() {
//       selectedItems = index;
//     });
//   }

//   @override
//   // ignore: non_constant_identifier_names
//   Widget build(BuildContext Context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black12,
//         title: const Text("E Ticketing"),
//       ),
//       body: Center(child: _WidgetOptions[selectedItems]),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedItems,
//         onTap: _tappeditem,
//         elevation: 10,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         selectedItemColor: Colors.blueGrey,
//         type: BottomNavigationBarType.fixed,
//         unselectedItemColor: const Color(0xFF526480),
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
//               activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
//               label: ""),
//           BottomNavigationBarItem(
//               icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
//               activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
//               label: ""),
//           BottomNavigationBarItem(
//               icon: Icon(FluentSystemIcons.ic_fluent_cast_regular),
//               activeIcon: Icon(FluentSystemIcons.ic_fluent_cast_regular),
//               label: ""),
//           BottomNavigationBarItem(
//               icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
//               activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
//               label: ""),
//           BottomNavigationBarItem(
//               icon: Icon(FluentSystemIcons.ic_fluent_add_regular),
//               activeIcon: Icon(FluentSystemIcons.ic_fluent_add_regular),
//               label: ""),
//         ],
//       ),
//     );
//   }
// }
