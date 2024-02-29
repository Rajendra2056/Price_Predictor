import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:valit/marketplace/market/main_screen.dart';

class SinglePageData extends StatefulWidget {
  final String hotelImage;
  final String hotelPrice;
  final String hotelName;
  final String hotellocation;
  const SinglePageData({
    Key? key,
    required this.hotelImage,
    required this.hotelName,
    required this.hotelPrice,
    required this.hotellocation,
  }) : super(key: key);

  @override
  State<SinglePageData> createState() => _SinglePageDataState();
}

class _SinglePageDataState extends State<SinglePageData> {
  Map<String, dynamic> hotelData = {
    'h_name': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 177, 112),
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 0),
        child: Column(
          children: [
            // _getAppBarUI(),
            // _getSearchBarUI(),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Container(
                height: 370,
                width: 250,
                child: Image.network(
                  widget.hotelImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Container(
              height: 370,
              width: 412,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.elliptical(41, 41)),
                  border: Border.all(color: Colors.black, width: 2)),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 90,
                        width: 20,
                      ),
                      Text(
                        widget.hotelName, style: TextStyle(fontSize: 24),

                        //  widget.roomData.titleTxt,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        'PRICE: ${widget.hotelPrice}',
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 235),
                    child: Text(
                      'LOCATION: ${widget.hotellocation}',
                      style: TextStyle(fontSize: 20),
                      // textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 235),
                    child: Text(
                      'CONTACT: ${widget.hotellocation}',
                      style: TextStyle(fontSize: 20),
                      // textAlign: TextAlign.left,
                    ),
                  ),
                  slider3(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

slider3() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [sliderelement4(), sliderelement5(), sliderelement6()],
    ),
  );
}

sliderelement4() {
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
                'lib/icons/exposedlens.png',
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

sliderelement5() {
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
                'lib/icons/dents.png',
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

sliderelement6() {
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
                'lib/icons/cam.png',
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
