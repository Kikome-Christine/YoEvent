// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//         ),
//   );
//   }
// }



// FROM HomePage

// import 'package:flutter/material.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       appBar: AppBar(
//         title: Text("HOME PAGE"),
//         backgroundColor: Colors.lightBlue,
//         centerTitle: true,
//       ),

//       body: Container(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 height: 200,
//                 child: ListView.builder(
//                   itemCount: 20,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) => Container(
//                     height: 100,
//                     width: 100,
//                     margin: EdgeInsets.all(10),
//                     child: Center(
//                       child: Text("Wednesday $index"),
//                     ),
//                     color: Colors.lightBlue,
//                   ),
//                 ),
//               ),

//               SizedBox(
//                 height: 200,
//                 child: ListView.builder(
//                   itemCount: 20,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) => Container(
//                     height: 100,
//                     width: 100,
//                     margin: EdgeInsets.all(10),
//                     child: Center(
//                       child: Text("Wednesday $index"),
//                     ),
//                     color: Colors.lightBlue,
//                   ),
//                 ),
//               ),
              
//               Flexible(
//                 child: ListView.builder(
//                   itemCount: 15,
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) => ListTile(
//                     title: Text("List $index"),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       appBar: AppBar(
//         title: Text("HOME PAGE"),
//         backgroundColor: Colors.lightBlue,
//         centerTitle: true,
//       ),
//     );
//   }


// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {



import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EVENT HUB"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 16,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.amberAccent,
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          "$index . Am trying bro",
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

int Counter = 0;

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Its a Real Work"),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Counter += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 40,
                child: Image(
                  image: AssetImage("images/lady_bug.jpg"),
                ),
              ),
            ),
            Divider(
              height: 90,
              color: Colors.grey[800],
            ),
            Text(
              "NAME",
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Geoffrey",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Ninja Level",
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Level $Counter",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("Its a beautiful day"),
        backgroundColor: Colors.grey[800],
      ),
      body: Container(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 4,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[100],
              child: const Text("He'd have you all unravel at the"),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[200],
              child: const Text('Heed not the rabble'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[300],
              child: const Text('Sound of screams but the'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[400],
              child: const Text('Who scream'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[500],
              child: const Text('Revolution is coming...'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.teal[600],
              child: const Text('Revolution, they...'),
            ),
          ],
        ),
      ),
    );
  }
}

//CHAT
// class HomePage3 extends StatelessWidget {
//   final List<GridItemData> gridItems = [
//     GridItemData(
//       title: 'LADY BUG',
//       subtitle: 'Description of lady_bug',
//       imageAsset: 'images/lady_bug.jpg',
//     ),
//     GridItemData(
//       title: 'bird',
//       subtitle: 'Description of bird',
//       imageAsset: 'images/bird.jpg',
//     ),
//     GridItemData(
//       title: 'LADY BUG',
//       subtitle: 'Description of lady_bug',
//       imageAsset: 'images/lady_bug.jpg',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Display Page'),
//       ),
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // 2 items per row
//           crossAxisSpacing: 8.0,
//           mainAxisSpacing: 8.0,
//         ),
//         itemCount: gridItems.length,
//         itemBuilder: (context, index) {
//           return GridItem(
//             title: gridItems[index].title,
//             subtitle: gridItems[index].subtitle,
//             imageAsset: gridItems[index].imageAsset,
//             onTap: () {
//               // Navigate to another page when the grid item is tapped
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       DetailPage(gridItemData: gridItems[index]),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class GridItemData {
//   final String title;
//   final String subtitle;
//   final String imageAsset;

//   GridItemData(
//       {required this.title, required this.subtitle, required this.imageAsset});
// }

// class GridItem extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String imageAsset;
//   final VoidCallback onTap;

//   GridItem({
//     required this.title,
//     required this.subtitle,
//     required this.imageAsset,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8.0),
//           color: Colors.grey[200],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               imageAsset,
//               height: 100,
//               width: 100,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(height: 8),
//             Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//             Text(subtitle),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DetailPage extends StatelessWidget {
//   final GridItemData gridItemData;

//   DetailPage({required this.gridItemData});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(gridItemData.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               gridItemData.imageAsset,
//               height: 200,
//               width: 200,
//               fit: BoxFit.cover,
//             ),
//             SizedBox(height: 16),
//             Text(gridItemData.subtitle),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomePage4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Party Venues')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          // Replace these dummy data with actual data from your backend or database
          String title = 'Venue ${index + 1}';
          String description = 'Description of Venue ${index + 1}';
          String imageAsset = 'images/bird.jpg';

          return GridItem(
            title: title,
            description: description,
            imageAsset: imageAsset,
            onTap: () {
              // Implement onTap functionality (e.g., navigate to the venue details page)
            },
          );
        },
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageAsset;
  final VoidCallback onTap;

  GridItem({
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey[200],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageAsset,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// child: SingleChildScrollView(
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       SizedBox(
        //         height: 200,
        //         child: ListView.builder(
        //           itemCount: 20,
        //           scrollDirection: Axis.horizontal,
        //           itemBuilder: (context, index) => Container(
        //             height: 100,
        //             width: 100,
        //             margin: EdgeInsets.all(10),
        //             child: Center(
        //               child: Text("Wednesday $index"),
        //             ),
        //             color: Colors.lightBlue,
        //           ),
        //         ),
        //       ),
        //       SizedBox(
        //         height: 200,
        //         child: ListView.builder(
        //           itemCount: 20,
        //           scrollDirection: Axis.horizontal,
        //           itemBuilder: (context, index) => Container(
        //             height: 100,
        //             width: 100,
        //             margin: EdgeInsets.all(10),
        //             child: Center(
        //               child: Text("Wednesday $index"),
        //             ),
        //             color: Colors.lightBlue,
        //           ),
        //         ),
        //       ),
        //       Flexible(
        //         child: ListView.builder(
        //           itemCount: 15,
        //           shrinkWrap: true,
        //           physics: NeverScrollableScrollPhysics(),
        //           itemBuilder: (context, index) => ListTile(
        //             title: Text("List $index"),
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // )