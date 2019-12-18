import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_dev_group_kampala/global.dart';
//import 'package:url_launcher/url_launcher.dart';

class EventDetails extends StatelessWidget {
  final String eventID;

  const EventDetails({Key key, this.eventID}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var eventDoc = GDGKla.firestore
        .collection('events')
        .document(eventID)
        .get()
        .then((DocumentSnapshot ds) {
      return ds.data;
    }).asStream();
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: eventDoc,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError)
              return Center(child: new Text('Error: ${snapshot.error}'));
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 300,
                  automaticallyImplyLeading: true,
                  leading: BackButton(
                    color: Colors.white,
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.event),
                      color: Colors.white,
                      onPressed: () {
                        final Event event = Event(
                          title: snapshot.data['event_name'],
                          location: snapshot.data['event_location'],
                          allDay: true,
                          startDate: DateTime.now(),
                          endDate: DateTime.now(),
                        );
                        Add2Calendar.addEvent2Cal(event);
                      },
                    )
                  ],
                  elevation: 0,
                  flexibleSpace: Hero(
                    tag: snapshot.data['event_header'],
                    child: FlexibleSpaceBar(
                      background: CachedNetworkImage(
                        imageUrl: snapshot.data['event_header'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          snapshot.data['event_name'],
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(fontSize: 25.0),
                        ),
                        SizedBox(height: 10),
                        Text(snapshot.data['event_location']),
                        SizedBox(height: 10),
                        Text(snapshot.data['event_address']),
                        SizedBox(height: 10),
                        Text(
                          snapshot.data['event_details'],
                          textAlign: TextAlign.justify,
                          softWrap: true,
                          style: Theme.of(context).textTheme.subhead,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        child: const Icon(Icons.local_activity),
        //label: const Text('Add a task'),
        tooltip: 'Add to calendar',
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            BackButton(),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.location_on),
              onPressed: () async {
                // final url = 'https://www.google.com/maps/search/${Uri.encodeFull(address)}';
                // launch(url);
              },
            )
          ],
        ),
      ),
    );
  }
}
