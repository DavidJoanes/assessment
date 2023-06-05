import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controller/controller.dart';
import 'screens/home_frame.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

final constantValues = Get.put(Constants());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final constantValues = Get.put(Constants());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AB Courier',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomeFrame(),
    );
  }
}
