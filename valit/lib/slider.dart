import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'marketplace/market/market.dart';

import 'material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FanCarouselImageSlider',
      theme: ThemeData(
        primarySwatch: myColor,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<String> sampleImages = [
    'https://img.freepik.com/free-photo/lovely-woman-vintage-outfit-expressing-interest-outdoor-shot-glamorous-happy-girl-sunglasses_197531-11312.jpg?w=1800&t=st=1673886721~exp=1673887321~hmac=57318aa37912a81d9c6e8f98d4e94fb97a766bf6161af66488f4d890f88a3109',
    'https://img.freepik.com/free-photo/attractive-curly-woman-purple-cashmere-sweater-fuchsia-sunglasses-poses-isolated-wall_197531-24158.jpg?w=1800&t=st=1673886680~exp=1673887280~hmac=258c92922874ad41d856e7fdba03ce349556cf619de4074143cec958b5b4cf05',
    'https://img.freepik.com/free-photo/stylish-blonde-woman-beret-beautiful-french-girl-jacket-standing-red-wall_197531-14428.jpg?w=1800&t=st=1673886821~exp=1673887421~hmac=5e77d3fab088b29a3b19a9023289fa95c1dc2af15565f290886bab4642fa2621',
    'https://img.freepik.com/free-photo/pretty-young-girl-with-pale-skin-dark-hair-french-beret-sunglasses-polka-dot-skirt-white-top-red-shirt-walking-around-sunny-city-laughing_197531-24480.jpg?w=1800&t=st=1673886800~exp=1673887400~hmac=9a1c61de63180118c5497ce105bbb36bfbb53050111de466d5110108848f2128',
    'https://img.freepik.com/free-photo/elegant-woman-brown-coat-spring-city_1157-33434.jpg?w=1800&t=st=1673886830~exp=1673887430~hmac=cc8c28a9332e008db251bdf9c7b838b7aa5077ec7663773087a8cc56d11138ff',
    'https://img.freepik.com/free-photo/high-fashion-look-glamor-closeup-portrait-beautiful-sexy-stylish-blond-young-woman-model-with-bright-yellow-makeup-with-perfect-clean-skin-with-gold-jewelery-black-cloth_158538-2003.jpg?w=826&t=st=1673886857~exp=1673887457~hmac=3ba51578e6a1e9c58e95a6b72e492cbbc26abf8e2f116a0672113770d3f4edbe',
  ];

  // String get src => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 60, 0),
              child: Text(
                'username',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
              child: Container(
                height: 110, width: 110,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.circular(50)), //Image.network(src)
              ),
            ),
            SizedBox(
              height: 20,
            ),
            drawerItem('WISHLIST'),
            SizedBox(
              height: 20,
            ),
            drawerItem('CART'),
            SizedBox(
              height: 20,
            ),
            drawerItem('DARK MODE'),
            SizedBox(
              height: 20,
            ),
            drawerItem('LOGOUT'),
          ],
        ),

        // child: ListView(
        //   children: [

        //     ListTile(
        //       leading: Icon(Icons.home),
        //       title: Text('Home'),
        //       onTap: () {
        //         // Handle drawer item tap
        //       },
        //     ),
        //     ListTile(
        //       leading: Icon(Icons.settings),
        //       title: Text('Settings'),
        //       onTap: () {
        //         // Handle drawer item tap
        //       },
        //     ),
        //   ],
        // ),
      ),
      body: Builder(builder: (BuildContext context) {
        return SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: 70,
          ),
          Row(
            children: [
              SizedBox(width: 10),
              Text("Discover",
                  style: TextStyle(
                    fontSize: 15,
                  )),
              SizedBox(width: 285),
              GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Container(
                    height: 40, width: 40,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.circular(20)), //Image.network(src)
                  ))
            ],
          ),
          SizedBox(height: 20),
          Container(
              height: 48,
              width: 310,
              child: OutlineSearchBar(
                borderWidth: 3,
                borderRadius: BorderRadius.horizontal(
                    right: Radius.elliptical(41, 41),
                    left: Radius.elliptical(41, 41)),
              )),
          SizedBox(height: 40),
          slider2(),
          // dashboard(),

          // Container(child: Column(children: [itemlist()]))
        ]));
      }),
    );
  }
}

Slider() {
  return Container(
    height: 100,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.black),
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
          ),
          height: 104,
          width: 115,
          child: ClipRRect(
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.black),
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
          ),
          height: 104,
          width: 115,
          child: ClipRRect(
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.black),
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
          ),
          height: 104,
          width: 115,
          child: ClipRRect(
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.black),
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
          ),
          height: 104,
          width: 115,
          child: ClipRRect(
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.black),
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
          ),
          height: 104,
          width: 115,
          child: ClipRRect(
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.black),
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
          ),
          height: 104,
          width: 115,
          child: ClipRRect(
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.black),
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
          ),
          height: 104,
          width: 115,
          child: ClipRRect(
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.black),
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
          ),
          height: 104,
          width: 115,
          child: ClipRRect(
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.black),
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
          ),
          height: 104,
          width: 104,
          child: ClipRRect(
            borderRadius: BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 5, color: Colors.black),
            borderRadius: const BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
          ),
          height: 104,
          width: 104,
          child: ClipRRect(
            borderRadius: const BorderRadius.horizontal(
                right: Radius.elliptical(41, 41),
                left: Radius.elliptical(41, 41)),
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
        ),
      ],
    ),
  );
}

//item list view
itemlist() {
  return Flexible(
    child: ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return const ListTile(
          title: Text('iphone'),
          subtitle: Text('iphone8'),
          leading: Icon(Icons.star),
        );
      },
    ),
  );
}

doNothing() {}

dashboard() {
  final List<String> imageUrls = [
    'https://picsum.photos/200',
    'https://picsum.photos/200',
    'https://picsum.photos/200',
    'https://picsum.photos/200',
  ];
  return Container(
    padding: EdgeInsets.all(16.0),
    child: GridView.builder(
      itemCount: imageUrls.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Image.network(imageUrls[index]);
      },
    ),
  );
}

slider2() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [sliderelement(), sliderelement(), sliderelement()],
    ),
  );
}

sliderelement() {
  return Padding(
    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
    child: Container(
      width: 150,
      height: 125,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x1F000000),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5, 12, 12, 12),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              // alignment: AlignmentDirectional(0.9, 0),
              child: Image.asset(
                'lib/icons/deadspot.png',
                width: 46.3,
                height: 70.8,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              ' DEADSPOT',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

drawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Drawer Header',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Do something
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Do something
          },
        ),
      ],
    ),
  );
}

drawerItem(String name) {
  return Container(
    height: 50,
    width: 160,
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        //color: Colors.green
        // color: Color.fromARGB(255, 18, 133, 133),
        borderRadius: BorderRadius.horizontal(
            right: Radius.elliptical(41, 41), left: Radius.elliptical(41, 41))),
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 20),
    ),
  );
}
