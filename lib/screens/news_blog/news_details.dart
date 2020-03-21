import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_dev_group_kampala/global.dart';
//import 'package:html2md/html2md.dart' as html2md;

class NewsBlogDetails extends StatelessWidget {
  final String blogId;

  const NewsBlogDetails({Key key, this.blogId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var newsDoc =
        GDGKla.firestore.collection('blog').document(blogId).snapshots();
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: newsDoc,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var newsDetails = snapshot.data;
          if (snapshot.hasError)
            return Center(child: new Text('Error: ${snapshot.error}'));
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return Container(
            child: Container(
              child: Markdown(
                data: newsDetails['content'],
                selectable: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
