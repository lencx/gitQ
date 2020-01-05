/***
 * @author: lencx
 * @create_at: Jan 04, 2020
 **/
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget getAvatar(String url, {
  double width = 36.0,
  double height = 36.0,
  BorderRadius borderRadius,
}) {
  final defaultImage = Image.asset(
    'assets/logo/gitQ@3.png',
    width: width,
    height: height,
  );

  return ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.circular(2),
    child: CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url,
      placeholder: (context, url) => new CircularProgressIndicator(),
      errorWidget: (context, url, error) => defaultImage,
    ),
  );
}

Widget getLogo({
  double width = 80.0,
  double height = 80.0,
  BorderRadius borderRadius
}) {
  return ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.circular(2.0),
    child:
    Image.asset(
      'assets/logo/gitQ@3x.png',
      width: width,
      height: height,
    ),
  );
}