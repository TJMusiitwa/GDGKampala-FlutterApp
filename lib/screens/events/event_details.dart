import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_dev_group_kampala/global.dart';
//import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      color: Colors.red,
                      tooltip: 'Add this event to your calendar',
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
                    ),
                    IconButton(
                      icon: Icon(Icons.location_on),
                      color: Colors.red,
                      onPressed: () async {
                        final url =
                            'https://www.google.com/maps/search/${Uri.encodeFull(snapshot.data['event_location'])}';
                        launch(url);
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
                        colorBlendMode: BlendMode.darken,
                        color: Colors.black12,
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
        tooltip: 'Reserve to Attend',
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
                'This will give the ability to have the user reserve to attend the event.'),
          ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 4.0,
      //   child: new Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: <Widget>[
      //       BackButton(),
      //       IconButton(
      //         icon: Icon(Icons.share),
      //         onPressed: () {
      //           Share.share('Hey I am sharing this ');
      //         },
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.location_on),
      //         onPressed: () async {
      //           //  final url = 'https://www.google.com/maps/search/${Uri.encodeFull(eventDoc.singleWhere(f)=>ds.data[''])}';
      //           //  launch(url);
      //         },
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
