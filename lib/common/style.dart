/***
 * @author: lencx
 * @created_at: Dec 30, 2019
 **/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// gitQ layout
const double SIDE_PAD = 16.0;
const double GUTTER = 5.0;

// gitQ theme color
const APP_THEMES = <MaterialColor>[
  Colors.lightBlue,
  Colors.brown,
  Colors.amber,
  Colors.pink,
  Colors.grey,
];

// gitQ fontSize
const double lgText = 26.0;
const double mdText = 20.0;
const double smText = 16.0;

final appBarTextStyle = GoogleFonts.lato(
  fontWeight: FontWeight.w400,
  fontSize: mdText,
);

final titleTextStyle = GoogleFonts.courierPrime(
  fontWeight: FontWeight.w400,
  fontSize: lgText,
);

final body1TextStyle = GoogleFonts.muli(
  fontWeight: FontWeight.w400,
  fontSize: mdText,
);