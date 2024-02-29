// import 'package:flutter/material.dart';

// import 'api.dart';

// class MyApp1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Prediction App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Prediction App'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final inputController = TextEditingController();

//   double? prediction;

//   void _fetchPrediction() async {
//     final inputText = inputController.text;

//     final inputValues = inputText
//         .split(',')
//         .map(double.tryParse)
//         .where((v) => v != null)
//         .cast<double>()
//         .toList();

//     try {
//       final result = await fetchPrediction(inputValues);
//       setState(() {
//         prediction = result;
//       });
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error fetching prediction: $e'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             TextField(
//               controller: inputController,
//               decoration: InputDecoration(
//                 labelText: 'Enter comma-separated input values',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _fetchPrediction,
//               child: Text('Get Prediction'),
//             ),
//             SizedBox(height: 16),
//             if (prediction != null)
//               Text(
//                 'Prediction: $prediction',
//                 style: TextStyle(fontSize: 20),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     inputController.dispose();
//     super.dispose();
//   }
// }
