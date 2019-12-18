import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_dev_group_kampala/global.dart';
import 'package:google_dev_group_kampala/utils/color_tools.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamScreen extends StatefulWidget {
  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Team'),
        elevation: 0.0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: GDGKla.firestore.collection('team').snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            return Center(child: new Text('Error: ${snapshot.error}'));
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());  
          return ListView(
            children:
                snapshot.data.documents.map<Widget>((DocumentSnapshot team) {
              return Card(
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints.expand(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        child: Image.network(team['image'], fit: BoxFit.cover),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(team['name'],
                                style: Theme.of(context).textTheme.title),
                            SizedBox(
                              height: 5,
                            ),
                            AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 5.0,
                              color:
                                  ColorTools.multiColors[Random().nextInt(4)],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(team['position'],
                                style: Theme.of(context).textTheme.subtitle),
                            SizedBox(
                              height: 10.0,
                            ),
                            FittedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.mail_outline),
                                    iconSize: 30,
                                    onPressed: () {
                                      launch('mailto:' +
                                          team['social_links']['email']);
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
