import 'package:flutter/material.dart';
import 'package:valit/slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'go.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage()));
}

// class MyGridView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Grid View'),
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         childAspectRatio: 6,
//         mainAxisSpacing: 10,
//         crossAxisSpacing: 20,
//         children: [
//           Container(
//             height: 10,
//             width: 10,
//             color: Colors.red,
//             child: Center(child: Text('1')),
//           ),
//           Container(
//             color: Colors.green,
//             child: Center(child: Text('2')),
//           ),
//           Container(
//             color: Colors.blue,
//             child: Center(child: Text('3')),
//           ),
//           Container(
//             color: Colors.yellow,
//             child: Center(child: Text('4')),
//           ),
//         ],
//       ),
//     );
//   }
// }
