/***
 * @author: lencx
 * @create_at: Jan 01, 2020
 **/
import 'package:flutter/material.dart';
import 'package:gitq/common/style.dart';

class PadContainer extends StatelessWidget {
  final Widget _child;

  PadContainer(this._child);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: GUTTER, horizontal: SIDE_PAD),
      child: _child,
    );
  }
}