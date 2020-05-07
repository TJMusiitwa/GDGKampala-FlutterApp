import 'package:flutter/material.dart';
import 'package:google_dev_group_kampala/screens/settings/antiHPolicy.dart';
import 'package:google_dev_group_kampala/screens/settings/codeOfConduct.dart';
import 'package:theme_provider/theme_provider.dart';
// import 'package:google_dev_group_kampala/providers/theme_provider.dart';
// import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Email GDG Kampala'),
              onTap: () async {
                var emailUrl =
                    'mailto:slugada@gmail.com?subject=GDG Kampala Contact';
                var out = Uri.encodeFull(emailUrl);
                launch(out);
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share the GDG Kampala App'),
              subtitle: Text('Tell your friends & collegues about the app'),
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('This share link will be updated soon.'),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.code),
              subtitle: Text(
                  'You are welcome to explore the source code for the app'),
              title: Text('Github link'),
              onTap: () {
                launch('https://github.com/TJMusiitwa/GDGKampala-FlutterApp');
              },
            ),
            ListTile(
              title: Text('Code of Conduct'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CodeOfConductPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Anti Harrasment Policy'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AHPolicyPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Open sources licenses'),
              onTap: () {
                showLicensePage(context: context);
              },
            ),
            ListTile(
              title: Text('Switch Theme'),
              trailing: CycleThemeIconButton(),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Text(
                  '🔨 with 💙 in Flutter, 👨🏾‍💻 by Jonathan Thomas Musiitwa',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
