import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_dev_group_kampala/global.dart';
import 'package:google_dev_group_kampala/universal/gdg_nav.dart';

Future main() async {
  //* Force a potrait only orientation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //Enable Crashlytics
  FlutterError.onError = GDGKla.crashlytics.recordFlutterError;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final generalTheme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'GDG Kampala',
      theme: ThemeData(primaryColor: Colors.white),
      home: GDGBottomNav(),
    );
  }
}
