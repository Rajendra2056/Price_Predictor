import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:memory_info/memory_info.dart';

class MyApp3 extends StatefulWidget {
  @override
  _MyApp3State createState() => _MyApp3State();
}

class _MyApp3State extends State<MyApp3> {
  Memory? _memory;
  DiskSpace? _diskSpace;

  @override
  void initState() {
    super.initState();
    getMemoryInfo();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<int> getMemoryInfo() async {
    var cleanram = 0;
    Memory? memory;
    DiskSpace? diskSpace;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      memory = await MemoryInfoPlugin().memoryInfo;
      diskSpace = await MemoryInfoPlugin().diskSpace;
    } on PlatformException catch (e) {
      print('error $e');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;

    if (memory!.totalMem! < 8000) {
      cleanram = 2;
    }

    if (memory != null || diskSpace != null)
      setState(() {
        _memory = memory;
        _diskSpace = diskSpace;
      });
    return cleanram;
  }

  // Future<int> memory() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   int cleanRam = await getMemoryInfo();
  //   return cleanRam;
  // }

  @override
  Widget build(BuildContext context) {
    getMemoryInfo();
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');

    String memInfo = encoder.convert(_memory?.toMap());

    // reclean(memInfo);
    // String diskInfo = encoder.convert(_diskSpace?.toMap());
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: getMemoryInfo,
          child: Icon(Icons.update),
        ),
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MemInfo1:\n',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              Text('$memInfo'),
              Text('\n--------------------------------------------\n'),
              Text(
                'DiskInfo:\n',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              Text('hell')
            ],
          ),
        ),
      ),
    );
  }
}

reclean(int meminfo) {
  if (meminfo <= 8000) {
    meminfo = 2;
    return meminfo;
  }
}
















// // Copyright 2017 The Chromium Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.

// // ignore_for_file: public_member_api_docs

// import 'dart:async';
// import 'dart:developer' as developer;
// import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// // void main() {
// //   runZonedGuarded(() {
// //     runApp(const MyApp());
// //   }, (dynamic error, dynamic stack) {
// //     developer.log("Something went wrong!", error: error, stackTrace: stack);
// //   });
// // }

// class MyApp3 extends StatefulWidget {
//   const MyApp3({Key? key}) : super(key: key);

//   @override
//   State<MyApp3> createState() => _MyApp3State();
// }

// class _MyApp3State extends State<MyApp3> {
//   static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//   Map<String, dynamic> _deviceData = <String, dynamic>{};

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   Future<void> initPlatformState() async {
//     var deviceData = <String, dynamic>{};

//     try {
//       if (kIsWeb) {
//         deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
//       } else {
//         if (Platform.isAndroid) {
//           deviceData =
//               _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
//         } else if (Platform.isIOS) {
//           deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
//         } else if (Platform.isLinux) {
//           deviceData = _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
//         } else if (Platform.isMacOS) {
//           deviceData = _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
//         } else if (Platform.isWindows) {
//           deviceData =
//               _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
//         }
//       }
//     } on PlatformException {
//       deviceData = <String, dynamic>{
//         'Error:': 'Failed to get platform version.'
//       };
//     }

//     if (!mounted) return;

//     setState(() {
//       _deviceData = deviceData;
//     });
//   }

//   Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
//     return <String, dynamic>{
//       'version.securityPatch': build.version.securityPatch,
//       'version.sdkInt': build.version.sdkInt,
//       'version.release': build.version.release,
//       'version.previewSdkInt': build.version.previewSdkInt,
//       'version.incremental': build.version.incremental,
//       'version.codename': build.version.codename,
//       'version.baseOS': build.version.baseOS,
//       'board': build.board,
//       'bootloader': build.bootloader,
//       'brand': build.brand,
//       'device': build.device,
//       'display': build.display,
//       'fingerprint': build.fingerprint,
//       'hardware': build.hardware,
//       'host': build.host,
//       'id': build.id,
//       'manufacturer': build.manufacturer,
//       'model': build.model,
//       'product': build.product,
//       'supported32BitAbis': build.supported32BitAbis,
//       'supported64BitAbis': build.supported64BitAbis,
//       'supportedAbis': build.supportedAbis,
//       'tags': build.tags,
//       'type': build.type,
//       'isPhysicalDevice': build.isPhysicalDevice,
//       'systemFeatures': build.systemFeatures,
//       'displaySizeInches':
//           ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
//       'displayWidthPixels': build.displayMetrics.widthPx,
//       'displayWidthInches': build.displayMetrics.widthInches,
//       'displayHeightPixels': build.displayMetrics.heightPx,
//       'displayHeightInches': build.displayMetrics.heightInches,
//       'displayXDpi': build.displayMetrics.xDpi,
//       'displayYDpi': build.displayMetrics.yDpi,
//       'serialNumber': build.serialNumber,
//     };
//   }

//   Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
//     return <String, dynamic>{
//       'name': data.name,
//       'systemName': data.systemName,
//       'systemVersion': data.systemVersion,
//       'model': data.model,
//       'localizedModel': data.localizedModel,
//       'identifierForVendor': data.identifierForVendor,
//       'isPhysicalDevice': data.isPhysicalDevice,
//       'utsname.sysname:': data.utsname.sysname,
//       'utsname.nodename:': data.utsname.nodename,
//       'utsname.release:': data.utsname.release,
//       'utsname.version:': data.utsname.version,
//       'utsname.machine:': data.utsname.machine,
//     };
//   }

//   Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
//     return <String, dynamic>{
//       'name': data.name,
//       'version': data.version,
//       'id': data.id,
//       'idLike': data.idLike,
//       'versionCodename': data.versionCodename,
//       'versionId': data.versionId,
//       'prettyName': data.prettyName,
//       'buildId': data.buildId,
//       'variant': data.variant,
//       'variantId': data.variantId,
//       'machineId': data.machineId,
//     };
//   }

//   Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
//     return <String, dynamic>{
//       'browserName': describeEnum(data.browserName),
//       'appCodeName': data.appCodeName,
//       'appName': data.appName,
//       'appVersion': data.appVersion,
//       'deviceMemory': data.deviceMemory,
//       'language': data.language,
//       'languages': data.languages,
//       'platform': data.platform,
//       'product': data.product,
//       'productSub': data.productSub,
//       'userAgent': data.userAgent,
//       'vendor': data.vendor,
//       'vendorSub': data.vendorSub,
//       'hardwareConcurrency': data.hardwareConcurrency,
//       'maxTouchPoints': data.maxTouchPoints,
//     };
//   }

//   Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
//     return <String, dynamic>{
//       'computerName': data.computerName,
//       'hostName': data.hostName,
//       'arch': data.arch,
//       'model': data.model,
//       'kernelVersion': data.kernelVersion,
//       'majorVersion': data.majorVersion,
//       'minorVersion': data.minorVersion,
//       'patchVersion': data.patchVersion,
//       'osRelease': data.osRelease,
//       'activeCPUs': data.activeCPUs,
//       'memorySize': data.memorySize,
//       'cpuFrequency': data.cpuFrequency,
//       'systemGUID': data.systemGUID,
//     };
//   }

//   Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
//     return <String, dynamic>{
//       'numberOfCores': data.numberOfCores,
//       'computerName': data.computerName,
//       'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
//       'userName': data.userName,
//       'majorVersion': data.majorVersion,
//       'minorVersion': data.minorVersion,
//       'buildNumber': data.buildNumber,
//       'platformId': data.platformId,
//       'csdVersion': data.csdVersion,
//       'servicePackMajor': data.servicePackMajor,
//       'servicePackMinor': data.servicePackMinor,
//       'suitMask': data.suitMask,
//       'productType': data.productType,
//       'reserved': data.reserved,
//       'buildLab': data.buildLab,
//       'buildLabEx': data.buildLabEx,
//       'digitalProductId': data.digitalProductId,
//       'displayVersion': data.displayVersion,
//       'editionId': data.editionId,
//       'installDate': data.installDate,
//       'productId': data.productId,
//       'productName': data.productName,
//       'registeredOwner': data.registeredOwner,
//       'releaseId': data.releaseId,
//       'deviceId': data.deviceId,
//     };
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         useMaterial3: true,
//         colorSchemeSeed: const Color(0x9f4376f8),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             kIsWeb
//                 ? 'Web Browser info'
//                 : Platform.isAndroid
//                     ? 'Android Device Info'
//                     : Platform.isIOS
//                         ? 'iOS Device Info'
//                         : Platform.isLinux
//                             ? 'Linux Device Info'
//                             : Platform.isMacOS
//                                 ? 'MacOS Device Info'
//                                 : Platform.isWindows
//                                     ? 'Windows Device Info'
//                                     : '',
//           ),
//           elevation: 4,
//         ),
//         body: ListView(
//           children: _deviceData.keys.map(
//             (String property) {
//               return Row(
//                 children: <Widget>[
//                   Container(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Text(
//                       property,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                       child: Container(
//                     padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
//                     child: Text(
//                       '${_deviceData[property]}',
//                       maxLines: 10,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   )),
//                 ],
//               );
//             },
//           ).toList(),
//         ),
//       ),
//     );
//   }
// }
