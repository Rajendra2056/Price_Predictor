import 'package:flutter/material.dart';

class MyApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: LayoutBuilder(
        builder: (context, constraints) {
          return MyGridView();
        },
      ),
    );
  }

  // listview(){
  //   return container(``)
  // }

  GridView() {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('My Grid View'),
    //   ),
    //   body: GridView.count(
    //     crossAxisCount: 2,
    //     children: [
    //       Container(
    //         color: Colors.red,
    //         child: Center(child: Text('1')),
    //       ),
    //       Container(
    //         color: Colors.green,
    //         child: Center(child: Text('2')),
    //       ),
    //       Container(
    //         color: Colors.blue,
    //         child: Center(child: Text('3')),
    //       ),
    //       Container(
    //         color: Colors.yellow,
    //         child: Center(child: Text('4')),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Grid View'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Container(
            color: Colors.red,
            child: Center(child: Text('1')),
          ),
          Container(
            color: Colors.green,
            child: Center(child: Text('2')),
          ),
          Container(
            color: Colors.blue,
            child: Center(child: Text('3')),
          ),
          Container(
            color: Colors.yellow,
            child: Center(child: Text('4')),
          ),
        ],
      ),
    );
  }
}































// import 'package:flutter/material.dart';
// class MyGridView extends StatelessWidget {
//   final List<String> images;

//   const MyGridView({required this.images});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Grid View'),
//       ),
//       body: GridView.builder(
//         itemCount: images.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount:
//               3, // You can set this to any number of columns you want
//           mainAxisSpacing: 10.0,
//           crossAxisSpacing: 10.0,
//         ),
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               image: DecorationImage(
//                 image: AssetImage(images[index]),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
