import 'package:flutter/material.dart';
import 'package:valit/marketplace/sell/sell.dart';
import 'package:valit/marketplace/sell/sellnospecial.dart';

class MyWidget extends StatelessWidget {
  final double prediction;
  const MyWidget({super.key, required this.prediction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 250,
          ),
          Text(
            'ESTIMATED VALUATION \nOF YOUR PHONE IS',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                    right: Radius.elliptical(41, 41),
                    left: Radius.elliptical(41, 41)),
                border: Border.all(color: Colors.black, width: 2)),
            child: Center(
              child: Text(
                '$prediction',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => (HotelHomeScreen())),
                );
              },
              child: Container(
                height: 70,
                width: 190,
                decoration: BoxDecoration(
                    //color: Colors.green
                    color: Color.fromARGB(255, 18, 133, 133),
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.elliptical(41, 41),
                        left: Radius.elliptical(41, 41))),
                child: Text(
                  'SELL',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              )),
        ],
      ),
    );
  }
}
