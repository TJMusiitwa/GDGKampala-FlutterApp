import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChapterMap extends StatelessWidget {
  final List<DocumentSnapshot> documents;
  final LatLng initalPosition;
  final Completer<GoogleMapController> chapterCompleter;

  const ChapterMap(
      {Key key,
      @required this.documents,
      @required this.initalPosition,
      @required this.chapterCompleter})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: initalPosition, zoom: 12.0),
      markers: documents
          .map(
            (chapter) => Marker(
              markerId: MarkerId(chapter.documentID),
              position: LatLng(
                chapter['location'].latitude as double,
                chapter['location'].longitude as double,
              ),
              infoWindow: InfoWindow(title: chapter['chapter_name'] as String),
            ),
          )
          .toSet(),
      onMapCreated: (chapterCompleter) {
        this.chapterCompleter.complete(chapterCompleter);
      },
      mapType: MapType.normal,
    );
  }
}
