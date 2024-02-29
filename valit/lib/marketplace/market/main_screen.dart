import 'package:flutter/material.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

import 'package:valit/marketplace/market/singlepagedata.dart';
// import 'package:flutter_hotel_booking_ui/modules/hotel_booking/components/map_and_list_view.dart';

import 'phone_controller.dart';
// import 'package:flutter_hotel_booking_ui/modules/hotel_booking/fireBaseAddStore/addHotel_Screen.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

// import 'package:flutter_hotel_booking_ui/modules/hotel_booking/components/time_date_view.dart';

import 'package:provider/provider.dart';
import 'package:valit/login/signup.dart';

// import 'addHotel.dart';

class HomeScreen1 extends StatefulWidget {
  DataController controller = Get.put(DataController());
  final AnimationController animationController;
  HomeScreen1({Key? key, required this.animationController}) : super(key: key);

  @override
  _HotelHomeScreen1State createState() => _HotelHomeScreen1State();
}

class _HotelHomeScreen1State extends State<HomeScreen1>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController _animationController;
  // var hotelList = HotelListData.hotelList;
  ScrollController scrollController = new ScrollController();
  // int room = 1;
  // int ad = 2;
  // DateTime startDate = DateTime.now();
  // DateTime endDate = DateTime.now().add(Duration(days: 5));
  bool _isShowMap = false;

  final searchBarHieght = 158.0;
  final filterBarHieght = 52.0;
  @override
  void initState() {
    animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    _animationController =
        AnimationController(duration: Duration(milliseconds: 0), vsync: this);
    scrollController.addListener(() {
      if (scrollController.offset <= 0) {
        _animationController.animateTo(0.0);
      } else if (scrollController.offset > 0.0 &&
          scrollController.offset < searchBarHieght) {
        // we need around searchBarHieght scrolling values in 0.0 to 1.0
        _animationController
            .animateTo((scrollController.offset / searchBarHieght));
      } else {
        _animationController.animateTo(1.0);
      }
    });
    super.initState();
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

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
              drawerItem(context, 'WISHLIST', 'wishlist'),
              SizedBox(
                height: 20,
              ),
              drawerItem(context, 'CART', 'cart'),
              SizedBox(
                height: 20,
              ),
              drawerItem(context, 'SIGN UP', 'signup'),
              SizedBox(
                height: 20,
              ),
              drawerItem(context, 'LOGOUT', 'logout'),
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
        body: Builder(
          builder: (context) => GetBuilder<DataController>(
            builder: (controller) => controller.allProduct.isEmpty
                ? Column(
                    children: [
                      SingleChildScrollView(
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
                                      borderRadius: BorderRadius.circular(
                                          20)), //Image.network(src)
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
                      ])),
                      SizedBox(
                        height: 70,
                      ),
                      Center(
                          child: Image.asset(
                        'lib/icons/oops.gif',
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                      )),
                    ],
                  )
                : Column(
                    children: [
                      SingleChildScrollView(
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
                                      borderRadius: BorderRadius.circular(
                                          20)), //Image.network(src)
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
                      ])),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 6,
                            crossAxisCount: 2,
                          ),
                          shrinkWrap: true,
                          itemCount: controller.allProduct.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                var hotelprice = controller
                                    .allProduct[index].productprice
                                    .toString();
                                var hotelname =
                                    controller.allProduct[index].productname;
                                var hotelImage =
                                    controller.allProduct[index].productimage;
                                var hotellocation = controller
                                    .allProduct[index].productlocation;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SinglePageData(
                                        hotelImage: hotelImage,
                                        hotelName: hotelname,
                                        hotellocation: hotellocation,
                                        hotelPrice: hotelprice),
                                  ),
                                );
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.elliptical(21, 21),
                                        right: Radius.elliptical(21, 21))),
                                surfaceTintColor: Colors.white,
                                elevation: 5.0,
                                color: Colors.white,
                                shadowColor:
                                    const Color.fromARGB(255, 246, 242, 242)
                                        .withOpacity(1),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      // _getAppBarUI(),
                                      // _getSearchBarUI(),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 0)),
                                        height: 140,
                                        width: 140,
                                        child: Image.network(
                                          controller
                                              .allProduct[index].productimage,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              controller.allProduct[index]
                                                  .productname,

                                              //  widget.roomData.titleTxt,
                                              maxLines: 2,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                              'Rs: ${controller.allProduct[index].productprice.toStringAsFixed(controller.allProduct[index].productprice.truncateToDouble() == controller.allProduct[index].productprice ? 0 : 2)}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          // Text(
                                          //     'Hotel location: ${controller.allProduct[index].productprice.toString()}',
                                          //     style: TextStyle(
                                          //         fontWeight: FontWeight.normal)),
                                        ],
                                      ),

                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       left: 0, bottom: 20),
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.spaceBetween,
                                      //     children: [
                                      //       Expanded(
                                      //         child: ElevatedButton(
                                      //           onPressed: () {
                                      //             var hotelprice = controller
                                      //                 .allProduct[index]
                                      //                 .productprice
                                      //                 .toString();
                                      //             var hotelname = controller
                                      //                 .allProduct[index]
                                      //                 .productname;
                                      //             var hotelImage = controller
                                      //                 .allProduct[index]
                                      //                 .productimage;
                                      //             var hotellocation = controller
                                      //                 .allProduct[index]
                                      //                 .productlocation;
                                      //             Navigator.push(
                                      //               context,
                                      //               MaterialPageRoute(
                                      //                 builder: (context) =>
                                      //                     SinglePageData(
                                      //                         hotelImage:
                                      //                             hotelImage,
                                      //                         hotelName: hotelname,
                                      //                         hotellocation:
                                      //                             hotellocation,
                                      //                         hotelPrice:
                                      //                             hotelprice),
                                      //               ),
                                      //             );
                                      //           },
                                      //           child: Text(
                                      //             'Check details',
                                      //           ),

                                      //           //  => launch(
                                      //           // //     "tel:${controller.allProduct[index].phonenumber.toString()}"),
                                      //           // child: Text('CALL'),
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),

                                      GridView.count(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1,
                                        shrinkWrap: true,
                                        children: [],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ));
  }
}

drawerItem(BuildContext context, String name, String route1) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Signup()),
      );
    },
    child: Container(
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
              right: Radius.elliptical(41, 41),
              left: Radius.elliptical(41, 41))),
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    ),
  );
}

slider2() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [sliderelement(), sliderelement1(), sliderelement2()],
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
                'lib/icons/apple.png',
                width: 46.3,
                height: 70.8,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              ' BRAND',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

sliderelement1() {
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
                'lib/icons/samsung.png',
                width: 46.3,
                height: 70.8,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              ' BRAND',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}

sliderelement2() {
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
                'lib/icons/mi.png',
                width: 46.3,
                height: 70.8,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              ' BRAND',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}
