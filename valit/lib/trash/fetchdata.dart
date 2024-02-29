// import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future<double> fetchValue() async {
//   final response = await http.get(Uri.parse(
//       'http://127.0.0.1:5000/api?data=[[4,8000,1,6,6,64,0.4,1,0,0,1,0,1]]'));

//   if (response.statusCode == 200) {
//     final jsonData = json.decode(response.body);
//     final value = jsonData['value'];
//     return double.parse(value.toString());
//   } else {
//     throw Exception('Failed to load value');
//   }
// }









// class _MyAppState extends State<MyApp> {
//   double _result;

//   Future<void> _fetchData() async {
//     final response =
//         await http.get(Uri.parse('http://localhost:5000/api?data=[1.2, 3.4, 5.6]'));
//     final responseData = json.decode(response.body);
//     setState(() {
//       _result = responseData['output'];
//     });
//   }