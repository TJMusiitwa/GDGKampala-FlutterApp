import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_dev_group_kampala/global.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'widgets/chapter_carousel.dart';
import 'widgets/chapter_map.dart';

class ChaptersMapScreen extends StatefulWidget {
  @override
  _ChaptersMapScreenState createState() => _ChaptersMapScreenState();
}

class _ChaptersMapScreenState extends State<ChaptersMapScreen> {
  Stream<QuerySnapshot> _chapters;
  // Center of the Google Map
  final LatLng initialPosition = const LatLng(0.3132008, 32.5290845);
  final Completer<GoogleMapController> _mapCompleter = Completer();

  @override
  void initState() {
    super.initState();
    _chapters = GDGKla.firestore
        .collection('chapters')
        .orderBy('chapter_name')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chapter Locations'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _chapters,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return Center(child: const Text('Loading...'));
          }

          return Stack(
            children: <Widget>[
              ChapterMap(
                documents: snapshot.data.documents,
                initalPosition: initialPosition,
                chapterCompleter: _mapCompleter,
              ),
              ChapterCarousel(
                chapterController: _mapCompleter,
                documents: snapshot.data.documents,
              ),
            ],
          );
        },
      ),
    );
  }
}
