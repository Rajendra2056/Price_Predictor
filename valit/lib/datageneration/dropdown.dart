// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:valit/datageneration/manualdata.dart';

// String dropdownValue = dropdownValue;
// dropmedown2(String first, String second, String third, String four,
//     OnDropdownChanged onChanged) {
//   return Center(
//     child:
//         StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
//       return DropdownButton<String>(
//         key: ValueKey(first),
//         value: dropdownValue,
//         onChanged: (String? newValue) {
//           onChanged(newValue!);

//           // setState(() {
//           //   dropdownValue = newValue!;
//           // });
//         },
//         items: <String>[first, second, third, four]
//             .map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: dropdownValue,
//             child: Text(value),
//           );
//         }).toList(),
//       );
//     }),
//   );
// }
