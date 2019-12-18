import 'package:flutter/material.dart';
import 'package:google_dev_group_kampala/global.dart';

class ErrorPage extends StatelessWidget {
  final String pageNotFound;

  const ErrorPage({Key key, this.pageNotFound}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.2), BlendMode.dstATop),
                  image: AssetImage(GDGKla.logo),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'OOPS 404',
                  style: TextStyle(fontSize: 30),
                ),
                Image.asset(
                  'assets/images/GDGKampala.png',
                  fit: BoxFit.contain,
                ),
                Text('The $pageNotFound page cannot be found'),
                FlatButton(
                  child: Text('Go to Home Page'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'Home');
                    //Navigator.popAndPushNamed(context, 'Home');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
