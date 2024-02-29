// import 'package:flutter/material.dart';

// String dropdownValue = dropdownValue;

// typedef OnDropdownChanged = void Function(String?);

// Widget drop(String first, String second, String third, String four,
//     OnDropdownChanged onChanged) {
//   return Center(
//     child: DropdownButton<String>(
//       value: first,
//       onChanged: (String? newValue) {
//         onChanged(newValue);
//       },
//       underline: Container(),
//       items: <String>[first, second, third, four]
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     ),
//   );
// }

// class MyWidget2 extends StatefulWidget {
//   @override
//   _MyWidget2State createState() => _MyWidget2State();
// }

// class _MyWidget2State extends State<MyWidget2> {
//   String dropdownValue = 'first';

//   void onDropdownChanged(String? newValue) {
//     print('Dropdown value changed to: $newValue');
//     setState(() {
//       dropdownValue = newValue!;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // body: Column(
//         //   children: [
//         //     drop('first', 'second', 'third', 'four', onDropdownChanged),
//         //     Text('Dropdown value: $dropdownValue'),
//         //     ElevatedButton(
//         //       onPressed: () {
//         //         setState(() {
//         //           dropdownValue = 'second';
//         //         });
//         //       },
//         //       child: Text('Change value'),
//         //     ),
//         //   ],
//         // ),
//         );
//   }
// }
