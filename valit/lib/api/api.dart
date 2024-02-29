import 'dart:convert';
import 'package:http/http.dart' as http;

// Future<double> fetchHello(List<double> data) async {
//   final url = 'https://58eb-159-89-14-225.ngrok-free.app/api?data=';
//   final headers = {'Content-type': 'application/json'};
//   final payload = jsonEncode({'data': data});
//   final requestBody = json.encode({'data': data});
//   final response =
//       await http.post(Uri.parse(url), headers: headers, body: requestBody);
//   if (response.statusCode == 200) {
//     final jsonResponse = jsonDecode(response.body);
//     return jsonResponse['output'];
//   } else {
//     throw Exception('Failed to fetch prediction');
//   }
// }

// Future<void> fetchHello(List<double> data) async {
//   final response = await http.get(Uri.parse(
//       'https://58eb-159-89-14-225.ngrok-free.app/api?data=[[2,25000,4,1,4,128,3,0,0,0,1,0,1]])'));
//   if (response.statusCode == 200) {
//     final jsonResponse = jsonDecode(response.body);
//     print(jsonResponse['message']);
//   } else {
//     print('Request failed with status: ${response.statusCode}.');
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<double> fetchPrediction(
  String ram,
  String rom,
  String model,
  String camera,
  String condition,
  String originalpr,
  String age,
  String warranty,
  String dents,
  String scratch,
  String display,
  String chipped,
  String vendor,
) async {
  final values = [
    int.parse(condition),
    int.parse(originalpr),
    int.parse(vendor),
    int.parse(model),
    int.parse(ram),
    int.parse(rom),
    int.parse(age),
    int.parse(warranty),
    int.parse(dents),
    int.parse(scratch),
    int.parse(camera),
    int.parse(chipped),
    int.parse(display),
  ];

  final url = 'https://58eb-159-89-14-225.ngrok-free.app/api?data=' +
      json.encode([values]);
  final headers = {'Content-type': 'application/json'};
  final response = await http.get(Uri.parse(url), headers: headers);
  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final output = jsonResponse['output'];
    if (output is List) {
      return output.first.toDouble();
    } else {
      return output.toDouble();
    }
  } else {
    throw Exception('Failed to fetch prediction');
  }
}
















// Future<double> fetchPrediction(List<double> data) async {
//   final url = 'https://58eb-159-89-14-225.ngrok-free.app/api?data=';
//   final headers = {'Content-type': 'application/json'};
//   final payload = jsonEncode({'data': data});
//   final requestBody = json.encode({'data': data});
//   final response =
//       await http.post(Uri.parse(url), headers: headers, body: requestBody);
//   if (response.statusCode == 200) {
//     final jsonResponse = jsonDecode(response.body);
//     return jsonResponse['output'];
//   } else {
//     throw Exception('Failed to fetch prediction');
//   }
// }
// // [[2,25000,4,1,4,128,3,0,0,0,1,0,1]]