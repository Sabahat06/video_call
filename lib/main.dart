import 'dart:io';
import 'package:_sabahat_repo/app_config/app_colors.dart';
import 'package:_sabahat_repo/app_config/app_keys.dart';
import 'package:_sabahat_repo/pages/homepage.dart';
import 'package:_sabahat_repo/splash_screen/splash_screen.dart';
import 'package:dio/dio.dart' as deo;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: AppKeys.mainNavigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Video Call LSUK',
      theme: ThemeData(
        backgroundColor: AppColors.whiteColor,
        splashColor: AppColors.primaryColor,
        colorScheme: ThemeData().colorScheme.copyWith(primary: AppColors.primaryColor),
      ),
      // home: ARVRVIEW()
      home: SplashScreen()
    );
  }
}

// class ARVRVIEW extends StatefulWidget {
//   @override
//   _ARVRVIEWState createState() => _ARVRVIEWState();
// }

// class _ARVRVIEWState extends State<ARVRVIEW> {
//   Future<String> _fetch() async {
//     deo.Dio dio = deo.Dio();
//     dio.options.headers["Access-Control-Allow-Origin"] = "*";
//     dio.options.headers["Access-Control-Allow-Methods"] = "GET";
//     dio.options.headers["Access-Control-Allow-Headers"] = "Content-Type";
//     deo.Response response = await dio.get(
//         "https://storage.googleapis.com/trillo-cedar-gift-317820/groups/item3Ds/ios/original_pork_rinds.glb",
//         options: deo.Options(responseType: deo.ResponseType.bytes, headers: {"Access-Control-Allow-Origin": "*",}));
//
//     print(response.statusCode);
//
//     if (response.statusCode == 200) {
//       print('response.statusCode ${response.statusCode}');
//       if (Platform.isAndroid) {
//         var status = await Permission.storage.request();
//         if (status.isGranted) {
//           try {
//             var dir = await getExternalStorageDirectory();
//             //Check if folder com.onediamond.app/files is present or not
//             // var folder = Directory(dir.path + '/com.onediamond.app/files/');
//             var folder = Directory("${dir!.path}");
//             bool hasExisted = await folder.exists();
//             if (!hasExisted) {
//               folder.create();
//             }
//             // create file temp.glb in the folder
//             File file = File(folder.path + '/temp.glb');
//             print(file);
//             await file.writeAsBytes(response.data);
//             print("File Size: ${file.lengthSync()} bytes");
//             print("Last Modified: ${file.lastModifiedSync()}");
//             print("File Path: ${file.path}");
//             if (_fileExist(file.path)) {
//               print("file path is correct and file exist: ${file.path}");
//             } else {
//               print("file path is incorrect or file not found: ${file.path}");
//             }
//             return file.path;
//           } catch (e) {
//             print("File Path Not Foudnd.............${e}");
//             print(e);
//             return '';
//           }
//         } else {
//           print("Permission not granted to write to external storage");
//           return '';
//         }
//       } else {
//         var dir = await getApplicationDocumentsDirectory();
//         var file = File("${dir.path}");
//         await file.writeAsBytes(response.data);
//         print("File Size: ${file.lengthSync()} bytes");
//         print("Last Modified: ${file.lastModifiedSync()}");
//         print("File Path: ${file.path}");
//         if (_fileExist(file.path)) {
//           print("file path is correct and file exist: ${file.path}");
//         } else {
//           print("file path is incorrect or file not found: ${file.path}");
//         }
//         return file.path;
//       }
//     } else {
//       throw Exception("Failed to load 3D model");
//     }
//   }
//
//   bool _fileExist(path) {
//     print("File Path: $path");
//     File file = File("$path");
//     print('file existsSync $file.existsSync()');
//     return file.existsSync();
//   }
//
//   // bool _fileExist(path) {
//   //   print("File Path: $path"); // added this line
//   //   var file = File("$path");
//   //   print('file existsSync $file.existsSync()');
//   //   return file.existsSync();
//   // }
//
//   @override
//   void dispose() {
//     var file = File("temp.glb");
//     if (file.existsSync()) {
//       file.delete();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<String>(
//       future: _fetch(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData && snapshot.data != null) {
//           return Scaffold(
//               appBar: AppBar(
//                 backgroundColor: Color.fromARGB(255, 36, 42, 51),
//                 elevation: 0,
//                 title: Center(
//                   child: Text(
//                     "AR/VR VIEW",
//                     style: TextStyle(
//                       // color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//               ),
//               body: ModelViewer(
//                 src: "file://${snapshot.data!}",
//                 alt: "A 3D model not showing",
//                 ar: true,
//                 arModes: ["webxr", "quick-look"],
//                 cameraControls: true,
//                 autoRotate: true,
//                 backgroundColor: Colors.grey,
//               ));
//         } else if(snapshot.hasError) {
//           return const Text("Unable to load 3D Model!");
//         } else {
//           return Center(child: CircularProgressIndicator(),);
//         }
//       },
//     );
//   }
// }

