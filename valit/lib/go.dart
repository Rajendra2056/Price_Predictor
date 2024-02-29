import 'package:flutter/material.dart';
import 'package:valit/api/callapi.dart';

import 'package:valit/marketplace/market/main_screen.dart';
import 'package:valit/marketplace/market/market.dart';
import 'package:valit/marketplace/sell/sellnospecial.dart';
import 'package:valit/slider.dart';
import 'datageneration/manualdata.dart';

import 'api/inputapp.dart';
import 'datageneration/datagen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;

  static List<Widget> _widgetOptions = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _widgetOptions = [
      HomeScreen1(animationController: _animationController),
      AppleWidget(),
      // MyApp7(),
      MyApp3(),
    ];
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.horizontal(
            right: Radius.elliptical(41, 41), left: Radius.elliptical(41, 41)),
        child: ClipRRect(
          borderRadius: BorderRadius.horizontal(
              right: Radius.elliptical(41, 41),
              left: Radius.elliptical(41, 41)),
          child: BottomNavigationBar(
            //backgroundColor: Colors.teal,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Color.fromARGB(255, 150, 219, 224),
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'VAL',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.settings),
              //   label: 'Settings',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'manual',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
