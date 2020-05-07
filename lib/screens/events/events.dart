import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_dev_group_kampala/global.dart';
import 'package:intl/intl.dart';
import 'event_details.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  var dateFormat = DateFormat.yMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Events'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: GDGKla.firestore
            .collection("events")
            .where("event_dates", isGreaterThanOrEqualTo: '2020-05-01')
            .orderBy("event_dates", descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            return Center(child: new Text('Error: ${snapshot.error}'));
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasData == null) {
            return Center(
                child: Text('No upcoming events. Check back here soon'));
          }
          return ListView(
            children:
                snapshot.data.documents.map<Widget>((DocumentSnapshot event) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => EventDetails(
                        eventID: event.documentID,
                      ),
                    ),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: <Widget>[
                      Hero(
                        tag: event['event_header'],
                        child: Container(
                          height: 145,
                          width: 145,
                          padding: const EdgeInsets.only(
                              left: 0, top: 10, bottom: 70, right: 20),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                event['event_header'],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(event['event_name'],
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.headline5),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Text(event['event_dates']),
                            ],
                          ),
                        ),
                      ),
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
