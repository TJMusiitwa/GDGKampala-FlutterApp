import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_dev_group_kampala/global.dart';
import 'package:google_dev_group_kampala/universal/gdg_nav.dart';
import 'package:theme_provider/theme_provider.dart';

import 'utils/quick_actions_manager.dart';

Future main() async {
  runApp(MyApp());

  //* Force a potrait only orientation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //Enable Crashlytics
  FlutterError.onError = GDGKla.crashlytics.recordFlutterError;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final generalTheme = Provider.of<ThemeProvider>(context);
    return QuickActionsManager(
      child: ThemeProvider(
        saveThemesOnChange: true,
        loadThemeOnInit: true,
        child: ThemeConsumer(
          child: Builder(
            builder: (themeContext) {
              return MaterialApp(
                title: 'GDG Kampala',
                theme: ThemeProvider.themeOf(themeContext).data,
                home: GDGBottomNav(),
              );
            },
          ),
        ),
      ),
    );
  }
}
