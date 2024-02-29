import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp7 extends StatefulWidget {
  @override
  _MyApp7State createState() => _MyApp7State();
}

class _MyApp7State extends State<MyApp7> {
  final _formKey = GlobalKey<FormState>();
  final _inputController = TextEditingController();

  String _prediction = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Prediction App'),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _inputController,
                  decoration: InputDecoration(
                    hintText: 'Enter input data',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some data';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _fetchPrediction();
                    }
                  },
                  child: Text('Predict'),
                ),
                SizedBox(height: 20),
                if (_prediction.isNotEmpty)
                  Text('The prediction is $_prediction'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _fetchPrediction() async {
    final input = _inputController.text;
    final inputValues = input.split(',').map(double.parse).toList();

    try {
      final prediction = await fetchPrediction(inputValues);
      setState(() {
        _prediction = prediction.toStringAsFixed(2);
      });
    } catch (e) {
      print('Failed to fetch prediction: $e');
      setState(() {
        _prediction = 'error';
      });
    }
  }
}

Future<double> fetchPrediction(List<double> data) async {
  final url = 'https://58eb-159-89-14-225.ngrok-free.app/api?data=' +
      json.encode([data]);
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
