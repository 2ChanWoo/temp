import 'package:flutter/material.dart';
import 'package:lotto/test.dart';
import 'BMI.dart';
import 'basic.dart';
import 'customForm.dart';
//import 'package:firebase_admob/firebase_admob.dart';
//import 'package:firebase_core/firebase_core.dart';

void main() {
 // Admob.initialize(getAppId());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  //FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-9993888033176045/1999147308');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}
