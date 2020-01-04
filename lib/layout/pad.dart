/***
 * @author: lencx
 * @create_at: Jan 01, 2020
 **/
import 'package:flutter/material.dart';
import 'package:gitq/common/global.dart';

class PadContainer extends StatelessWidget {
  final Widget _child;

  PadContainer(this._child);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Global.gutter, horizontal: Global.sidePad),
      child: _child,
    );
  }
}