import 'package:flutter/material.dart';

import 'anti-harrasment_policy.dart';

class AHPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Anti Harrasment Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          antiharrasment_policy,
          softWrap: true,
          textWidthBasis: TextWidthBasis.parent,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
