import 'package:yo_event/Accounts/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: login(),
      ),
    );
  }
}
















// import 'package:flutter/material.dart';

// void main(){
//   runApp(Home());
// }

// class Home extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       color: Colors.blueGrey,
//       home: Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: Text("Event Hub",
//         style: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//           fontStyle: FontStyle.italic,
//         ),
//         ),
//       ),
//      //body: Home(),
//     ),
//     );
//   }
// }



// class Home extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.grey,
//           title: Text("EVENT HUB",
//           // style: TextStyle(
//           //   color: Colors.black,
//           // ), 
//           ),
//         ),
//         //body: SignInPage(),
//       ),
//     );
//   }
// }