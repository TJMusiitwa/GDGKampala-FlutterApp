import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_dev_group_kampala/global.dart';
import 'package:google_dev_group_kampala/screens/news_blog/news_details.dart';

class NewsBlogPage extends StatelessWidget {
  const NewsBlogPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var news = GDGKla.firestore
        .collection("blog")
        .orderBy("date", descending: true)
        .snapshots();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('News & Blog'),
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: news,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            default:
              return ListView(
                children: snapshot.data.documents
                    .map<Widget>((DocumentSnapshot newsItem) {
                  return ListTile(
                    title: Text(newsItem['title']),
                    subtitle: Text('Published: ' + newsItem['date']),
                    trailing: Chip(label: Text(newsItem['tag'])),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => NewsBlogDetails(
                                  blogId: newsItem.documentID)));
                    },
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }
}
