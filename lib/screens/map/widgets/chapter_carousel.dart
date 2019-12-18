import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_dev_group_kampala/global.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChapterCarousel extends StatelessWidget {
  final List<DocumentSnapshot> documents;
  final Completer<GoogleMapController> chapterController;

  const ChapterCarousel(
      {Key key, @required this.documents, @required this.chapterController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: SizedBox(
          height: 90,
          child: ChapterCarouselList(
            documents: documents,
            chapterController: chapterController,
          ),
        ),
      ),
    );
  }
}

class ChapterCarouselList extends StatelessWidget {
  final List<DocumentSnapshot> documents;
  final Completer<GoogleMapController> chapterController;

  const ChapterCarouselList(
      {Key key, @required this.documents, @required this.chapterController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: documents.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 340,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Card(
              child: Center(
                child: ChapterListTile(
                  document: documents[index],
                  chapterController: chapterController,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ChapterListTile extends StatefulWidget {
  final DocumentSnapshot document;
  final Completer<GoogleMapController> chapterController;

  const ChapterListTile({Key key, this.document, this.chapterController})
      : super(key: key);
  @override
  _ChapterListTileState createState() => _ChapterListTileState();
}

class _ChapterListTileState extends State<ChapterListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.document['chapter_name'] as String),
      leading: Container(
        width: 100,
        height: 100,
        child: Image.asset(
          GDGKla.logo2,
          fit: BoxFit.contain,
        ),
      ),
      onTap: () async {
        final controller = await widget.chapterController.future;
        await controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(
                widget.document['location'].latitude as double,
                widget.document['location'].longitude as double,
              ),
              zoom: 16),
        ));
      },
    );
  }
}
