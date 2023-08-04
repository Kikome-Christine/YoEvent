import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer = screenHeight / 3.84;
  static double pageView = screenHeight / 2.56;
  static double TextView = screenHeight / 7.03;

  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;

  static double font20 = screenHeight / 42.2;
  static double font10 = screenHeight / 84.4;

  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;
}

// import 'package:flutter/material.dart';

// class MyScreenDimension extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Get the screen size
//     Size screenSize = MediaQuery.of(context).size;

//     // Get the screen width and height
//     double screenWidth = screenSize.width;
//     double screenHeight = screenSize.height;

//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Screen Dimensions Example'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text('Screen Width: $screenWidth'),
//               Text('Screen Height: $screenHeight'),
              
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
