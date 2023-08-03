<<<<<<< Updated upstream
 
=======
import 'package:firebase_core/firebase_core.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';
 
import 'package:yo_event/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyA9YL-GFElLl--Ag311hR8NEEqGvHYPheU",
          projectId: "yoevent-500d7",
          messagingSenderId: "472628794772",
          appId: "1:472628794772:web:8751b605c3d84fa5ee2b81"));

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