import 'package:flutter/material.dart';
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
              title: Text('An email and you I will get back to you'),
              onTap: () async {
                var emailUrl =
                    'mailto:gdgKla@gmail.com?subject=GDG Kampala Contact';
                var out = Uri.encodeFull(emailUrl);
                launch(out);
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Sometimes you gotta phone to really reach me'),
              onTap: () async {
                launch('tel:+256389000839');
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text('Whatsapp works for us too'),
              onTap: () async {
                launch('whatsapp://send?phone=+26703034859');
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share the GDG Kampala App'),
              subtitle: Text('Tell your friends & collegues about the app'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Terms of use'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Privacy Policy'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Open sources licenses'),
              onTap: () {
                showLicensePage(context: context);
              },
            ),
            // SwitchListTile.adaptive(
            //   value: themeProvider.isLightTheme,
            //   onChanged: (val) {
            //     themeProvider.setThemeData(val);
            //   },
            //   title: Text('Change Theme'),
            // ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Text(
                  '🔨 with 💙 in Flutter, 👨🏾‍💻 by Jonathan Thomas Musiitwa',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subhead
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
