// import 'package:flutter/material.dart';
// import 'api.dart';

// class MyHomePage1 extends StatefulWidget {
//   @override
//   _MyHomePage1State createState() => _MyHomePage1State();
// }

// class _MyHomePage1State extends State<MyHomePage1> {
//   late Future<double> futureValue;

//   @override
//   void initState() {
//     super.initState();
//     futureValue = fetchPrediction();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: FutureBuilder<double>(
//           future: futureValue,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final value = snapshot.data!;
//               return Text('The value is $value');
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             }

//             return CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }
