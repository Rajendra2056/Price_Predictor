import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:valit/datageneration/dropdownimproved.dart';
import 'package:valit/finalresult/finalresult.dart';
import 'dart:convert';

import '../api/api.dart';

typedef OnDropdownChanged = void Function(String?);

class AppleWidget extends StatefulWidget {
  const AppleWidget({Key? key}) : super(key: key);

  @override
  _AppleWidgetState createState() => _AppleWidgetState();
}

class _AppleWidgetState extends State<AppleWidget> {
  // late AppleModel _model;
  String Ramdrop = '2';
  String Romdrop = '8';
  String Vendor = '2';
  String modeldrop = '0';
  String cameradrop = '1';
  String conditiondrop = '2';
  String originalpricedrop = '1';
  String agedrop = '2';
  String warrantydrop = '0';
  String dentsdrop = '2';
  String scratchdrop = '2';
  String displaydrop = '2';
  String chippeddrop = '2';

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  // void onDropdownChanged(String? newValue) {
  //   print('Dropdown value changed to: $newValue');
  //   setState(() {
  //     dropdownValue = newValue!;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // _model = createModel(context, () => AppleModel());
  }

  @override
  void dispose() {
    // _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        // appBar: AppBar(
        //   backgroundColor: Color.fromARGB(255, 11, 148, 112),
        //   automaticallyImplyLeading: false,
        //   title: Text(
        //     'Apple',
        //   ),
        //   actions: [],
        //   centerTitle: false,
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 0, top: 8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 170,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 147, 190, 190),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(-0.9, -0.65),
                            child: Text(
                              'Physical conditions',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 0, 12),
                                child: Container(
                                  width: 140,
                                  height: 120,
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
                                  child: Align(
                                    alignment: AlignmentDirectional(0, -0.1),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1, 0),
                                            child: Image.asset(
                                              'lib/icons/scratch.png',
                                              width: 50.1,
                                              height: 50.8,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            'scratch',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 0, 12),
                                child: Container(
                                  width: 140,
                                  height: 140,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 12, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(1, 0),
                                          child: Image.asset(
                                            'lib/icons/deadspot.png',
                                            width: 50.3,
                                            height: 50.7,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          ' deadpixel',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 12),
                                child: Container(
                                  width: 140,
                                  height: 140,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 12, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.9, 0),
                                          child: Image.asset(
                                            'lib/icons/camera.png',
                                            width: 40.3,
                                            height: 40.8,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          ' camera',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 12),
                                child: Container(
                                  width: 140,
                                  height: 140,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 12, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.9, 0),
                                          child: Image.asset(
                                            'lib/icons/btn_not.png',
                                            width: 54.9,
                                            height: 54.3,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          'BUTTON',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 12),
                                child: Container(
                                  width: 140,
                                  height: 140,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 12, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(1, 0),
                                          child: Image.asset(
                                            'lib/icons/dents.png',
                                            width: 68.6,
                                            height: 65,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          'Dents',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 12),
                                child: Container(
                                  width: 140,
                                  height: 140,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 12, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(1, 0),
                                          child: Image.asset(
                                            'lib/icons/frame.png',
                                            width: 59.4,
                                            height: 54.8,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          'Frame',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsetsDirectional.fromSTEB(
                              //       16, 0, 16, 12),
                              //   child: Container(
                              //     width: 140,
                              //     height: 140,
                              //     decoration: BoxDecoration(
                              //       color: Colors.white,
                              //       boxShadow: [
                              //         BoxShadow(
                              //           blurRadius: 4,
                              //           color: Color(0x1F000000),
                              //           offset: Offset(0, 2),
                              //         )
                              //       ],
                              //       borderRadius: BorderRadius.circular(12),
                              //     ),
                              //     child: Padding(
                              //       padding: EdgeInsetsDirectional.fromSTEB(
                              //           12, 12, 12, 12),
                              //       child: Column(
                              //         mainAxisSize: MainAxisSize.max,
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.start,
                              //         children: [
                              //           Align(
                              //             alignment:
                              //                 AlignmentDirectional(0.9, 0),
                              //             child: Image.asset(
                              //               'assets/images/iphone_13-removebg-preview.png',
                              //               width: 58.9,
                              //               height: 72.1,
                              //               fit: BoxFit.cover,
                              //             ),
                              //           ),
                              //           Text(
                              //             'iPhone 13',
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsetsDirectional.fromSTEB(
                              //       16, 0, 16, 12),
                              //   child: Container(
                              //     width: 140,
                              //     height: 140,
                              //     decoration: BoxDecoration(
                              //       color: Colors.white,
                              //       boxShadow: [
                              //         BoxShadow(
                              //           blurRadius: 4,
                              //           color: Color(0x1F000000),
                              //           offset: Offset(0, 2),
                              //         )
                              //       ],
                              //       borderRadius: BorderRadius.circular(12),
                              //     ),
                              //     child: Padding(
                              //       padding: EdgeInsetsDirectional.fromSTEB(
                              //           12, 12, 12, 12),
                              //       child: Column(
                              //         mainAxisSize: MainAxisSize.max,
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.center,
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.start,
                              //         children: [
                              //           Align(
                              //             alignment:
                              //                 AlignmentDirectional(0.75, 0),
                              //             child: Image.asset(
                              //               'assets/images/iphone_14-removebg-preview.png',
                              //               width: 38.8,
                              //               height: 72.5,
                              //               fit: BoxFit.cover,
                              //             ),
                              //           ),
                              //           Text(
                              //             'iPhone 14',
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 0, 0),
                    child: Text(
                      'device detail',
                      textAlign: TextAlign.start,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: Color(0xFFDBE2E7),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(children: [
                                  Text(
                                    'RAM',
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 250,
                                  ),

                                  DropdownButton<String>(
                                    value: Ramdrop,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        Ramdrop = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      '2',
                                      '3',
                                      '4',
                                      '6',
                                      '8',
                                      '12'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),

                                  // drop(first, second, third, four, onChanged),
                                ])
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(
                                'ROM',
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 240,
                              ),

                              DropdownButton<String>(
                                value: Romdrop,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    Romdrop = newValue!;
                                  });
                                },
                                items: <String>[
                                  '8',
                                  '16',
                                  '32',
                                  '64',
                                  '128',
                                  '256',
                                  '512',
                                  '1024',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                              // drop(first, second, third, four, onChanged),
                            ]),
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: Color(0xFFDBE2E7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // // Align(
                  // //   alignment: AlignmentDirectional(0.65, 0.2),
                  // //   child: Column(
                  // //     mainAxisSize: MainAxisSize.max,
                  // //     children: [
                  // //       Align(
                  // //         alignment: AlignmentDirectional(0.55, 0.65),
                  // //         child: Padding(
                  // //           padding: EdgeInsetsDirectional.fromSTEB(0, 35, 100, 0),
                  // //           child: FFButtonWidget(
                  // //             onPressed: () async {
                  // //               context.pushNamed('physicalconditio');
                  // //             },
                  // //             text: 'OK',
                  // //             options: FFButtonOptions(
                  // //               width: 130,
                  // //               height: 40,
                  // //               padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  // //               iconPadding:
                  // //                   EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  // //               color: FlutterFlowTheme.of(context).primary,
                  // //               textStyle: FlutterFlowTheme.of(context)
                  // //                   .titleSmall
                  // //                   .override(
                  // //                     fontFamily: 'Poppins',
                  // //                     color: Colors.white,
                  // //                   ),
                  // //               elevation: 20,
                  // //               borderSide: BorderSide(
                  // //                 color: Colors.transparent,
                  // //                 width: 1,
                  // //               ),
                  // //               borderRadius: BorderRadius.circular(8),
                  // //             ),
                  // //           ),
                  // //         ),
                  // //       ),
                  // //     ],
                  // //   ),
                  // // ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(
                                'MODEL',
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 200,
                              ),

                              DropdownButton<String>(
                                value: modeldrop,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    modeldrop = newValue!;
                                  });
                                },
                                items: <String>[
                                  '0',
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                  '6',
                                  '7',
                                  '8',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                              // drop(first, second, third, four, onChanged),
                            ]),
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: Color(0xFFDBE2E7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(
                                'VENDORS',
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 180,
                              ),

                              DropdownButton<String>(
                                value: Vendor,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    Vendor = newValue!;
                                  });
                                },
                                items: <String>[
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                              // drop(first, second, third, four, onChanged),
                            ]),
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: Color(0xFFDBE2E7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(
                                'CAMERA',
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 180,
                              ),

                              DropdownButton<String>(
                                value: cameradrop,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    cameradrop = newValue!;
                                  });
                                },
                                items: <String>[
                                  '1',
                                  '0'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                              // drop(first, second, third, four, onChanged),
                            ]),
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: Color(0xFFDBE2E7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(
                                'CONDITION',
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 160,
                              ),

                              DropdownButton<String>(
                                value: conditiondrop,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    conditiondrop = newValue!;
                                  });
                                },
                                items: <String>[
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                              // drop(first, second, third, four, onChanged),
                            ]),
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: Color(0xFFDBE2E7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(
                                'ORIGINAL PRICE',
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 0,
                              ),

                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: 'Product Price'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Product Price Required';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) =>
                                      originalpricedrop = value,
                                  onSaved: (value) {
                                    originalpricedrop = value!;
                                  },
                                ),
                              ),

                              // TextFormField(
                              //   keyboardType: TextInputType.text,
                              //   decoration: InputDecoration(
                              //     hintText: 'PHONE PRICE',
                              //     border: OutlineInputBorder(),
                              //   ),
                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return 'Please enter your name';
                              //     }
                              //     return null;
                              //   },
                              //   onSaved: (value) {
                              //     originalpricedrop = value!;
                              //   },
                              // ),

                              // drop(first, second, third, four, onChanged),
                            ]),
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: Color(0xFFDBE2E7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(
                                'AGE',
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 240,
                              ),

                              DropdownButton<String>(
                                value: agedrop,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    agedrop = newValue!;
                                  });
                                },
                                items: <String>[
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                  '6',
                                  '7',
                                  '8'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                              // drop(first, second, third, four, onChanged),
                            ]),
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: Color(0xFFDBE2E7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(
                                'WARRANTY',
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 160,
                              ),

                              DropdownButton<String>(
                                value: warrantydrop,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    warrantydrop = newValue!;
                                  });
                                },
                                items: <String>[
                                  '0',
                                  '1'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                              // drop(first, second, third, four, onChanged),
                            ]),
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: Color(0xFFDBE2E7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(
                                'DENTS',
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 190,
                              ),

                              DropdownButton<String>(
                                value: dentsdrop,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dentsdrop = newValue!;
                                  });
                                },
                                items: <String>[
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                              // drop(first, second, third, four, onChanged),
                            ]),
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: Color(0xFFDBE2E7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(
                                'SCRATCH',
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 150,
                              ),

                              DropdownButton<String>(
                                value: scratchdrop,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    scratchdrop = newValue!;
                                  });
                                },
                                items: <String>[
                                  '2',
                                  '1',
                                  '3',
                                  '4',
                                  '5'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                              // drop(first, second, third, four, onChanged),
                            ]),
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: Color(0xFFDBE2E7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(
                                'DISPLAY',
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 170,
                              ),

                              DropdownButton<String>(
                                value: displaydrop,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    displaydrop = newValue!;
                                  });
                                },
                                items: <String>[
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                              // drop(first, second, third, four, onChanged),
                            ]),
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: Color(0xFFDBE2E7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                    child: Container(
                      width: double.infinity,
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
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(
                                'CHIPPED',
                                style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 130,
                              ),

                              DropdownButton<String>(
                                value: chippeddrop,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    chippeddrop = newValue!;
                                  });
                                },
                                items: <String>[
                                  '1',
                                  '2',
                                  '3',
                                  '4',
                                  '5',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),

                              // drop(first, second, third, four, onChanged),
                            ]),
                            Divider(
                              height: 24,
                              thickness: 1,
                              color: Color(0xFFDBE2E7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  evaluatebtn(
                    context,
                    Ramdrop,
                    Romdrop,
                    modeldrop,
                    cameradrop,
                    conditiondrop,
                    originalpricedrop,
                    agedrop,
                    warrantydrop,
                    dentsdrop,
                    scratchdrop,
                    displaydrop,
                    chippeddrop,
                    Vendor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

dropdown(String name, double width, String first, String Second, String third,
    String four, OnDropdownChanged onChanged) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
        child: Container(
          width: double.infinity,
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
            padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                condenRow(
                  name,
                  width,
                ),
                Divider(
                  height: 24,
                  thickness: 1,
                  color: Color(0xFFDBE2E7),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

// drop(String first, String second, String third, String four,
//     OnDropdownChanged onChanged) {
//   return Center(
//     child: DropdownButton<String>(

//       value: dropdownValue,
//       onChanged: (String? newValue) {
//         onChanged(newValue);
//         // setState(() {
//         //   dropdownValue = newValue!;
//         // });
//       },
//       underline: Container(),
//       items: <String>[first, second, third, four]
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     ),
//   );
// }

condenRow(
  String name,
  double width,
) {
  return Row(children: [
    Text(
      name,
      style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    ),
    SizedBox(
      width: width,
    ),
    // drop(first, second, third, four, onChanged),
  ]);
}

evaluatebtn(
  BuildContext context,
  String Ram,
  String Rom,
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
) {
  print('i m hit');
  List<int> values = [];
  values.add(int.parse(condition));
  values.add(int.parse(originalpr));
  values.add(int.parse(vendor));
  values.add(int.parse(model));
  values.add(int.parse(Ram));
  values.add(int.parse(Rom));
  values.add(int.parse(age));
  values.add(int.parse(warranty));
  values.add(int.parse(dents));
  values.add(int.parse(scratch));
  values.add(int.parse(camera));
  values.add(int.parse(chipped));
  values.add(int.parse(display));

  Future<double> prediction = fetchPrediction(
    Ram,
    Rom,
    model,
    camera,
    condition,
    originalpr,
    age,
    warranty,
    dents,
    scratch,
    display,
    chipped,
    vendor,
  ).then((double prediction) {
    // Add a delay of 2 seconds
    return Future.delayed(Duration(seconds: 60), () => prediction);
  }).then(
      (double delayedPrediction) => goToNextPage(context, delayedPrediction));
  // .then((double prediction) => goToNextPage(context, prediction));
  // showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Predicted Price'),
  //         content: Text(prediction.toString()),
  //         actions: <Widget>[
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: const Text('OK'),
  //           ),
  //         ],
  //       );
  //     });

  return Center(
    child: ElevatedButton(
      onPressed: () {},
      child: Image.asset(
        'lib/icons/logo.png',
        width: 40,
        height: 40,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        elevation: MaterialStateProperty.all<double>(4),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(fontSize: 16),
        ),
      ),
    ),
  );
}

goToNextPage(BuildContext context, double prediction) {
  print('goToNextPage called');
  print(prediction);
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => MyWidget(
              prediction: prediction,
            )),
  );
}

value(double value) {
  var price = value;
}
