import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_dev_group_kampala/global.dart';
import 'package:google_dev_group_kampala/screens/events/event_details.dart';
import 'package:google_dev_group_kampala/screens/events/events.dart';
import 'package:intl/intl.dart';

class HomeEventsList extends StatelessWidget {
  final String dateFormat;

  const HomeEventsList({
    Key key,
    @required this.dateFormat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: StreamBuilder<QuerySnapshot>(
        stream: GDGKla.firestore
            .collection('events')
            .where("event_dates", isGreaterThanOrEqualTo: '2020-05-01')
            .orderBy("event_dates", descending: true)
            .snapshots()
            .take(4),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: snapshot.data.documents
                .map<Widget>((DocumentSnapshot homeEventCard) {
              return SizedBox(
                width: 200,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) =>
                            EventDetails(eventID: homeEventCard.documentID)));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            homeEventCard['event_name'],
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(fontSize: 20),
                            //overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            homeEventCard['event_date'],
                            softWrap: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 20),
                            overflow: TextOverflow.clip,
                          ),
                        ],
                      ),
                    ),
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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var dateFormat = DateFormat.yMd().format(DateTime.now().toUtc());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 0.0,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  GDGKla.chapter_logo,
                  fit: BoxFit.fitWidth,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '''Google Developer Groups (GDG) Kampala is a user group for people who are interested in Google's developer technology; everything from the Android and App Engine platforms, to product APIs like the YouTube API and the Google Calendar API, to initiatives like OpenSocial.\nEvents are held monthly at the Outbox Hub on the fourth floor of Soliz House , Lumumba Avenue, Kampala.''',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Upcoming Events'),
                FlatButton(
                  child: Text('See all'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => EventsScreen()));
                  },
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            HomeEventsList(dateFormat: dateFormat),
          ],
        ),
      ),
    );
  }
}
