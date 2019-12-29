import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSection extends StatelessWidget {
  final String _title;
  final String _body;
  static const double _hPad = 16.0;

  // TextSection(Color color) {
  //   this._color = color;
  // }
  TextSection(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(_hPad, 20.0, _hPad, 5.0),
          child: Text(_title, style: Theme.of(context).textTheme.title),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(_hPad, 8.0, _hPad, _hPad),
          child: Text(_body, style: Theme.of(context).textTheme.body1),
        ),
      ]
    );
}
}