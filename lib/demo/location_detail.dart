import 'package:flutter/material.dart';
import 'text_section.dart';
import 'image_banner.dart';

class LocationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Detail'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ImageBanner('assets/images/banner/1.png'),
          TextSection('hello', 'slaks ldk klsdk lskdl ksld klsk, als sla, sleoro swew. elc ld c sdld sld'),
          TextSection('hello', 'slaks ldk klsdk lskdl ksld klsk, als sla, sleoro swew. elc ld c sdld sld'),
          TextSection('hello', 'slaks ldk klsdk lskdl ksld klsk, als sla, sleoro swew. elc ld c sdld sld'),
        ],
      )
    );
  }
}