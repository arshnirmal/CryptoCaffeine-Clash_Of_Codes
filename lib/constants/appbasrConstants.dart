import 'package:flutter/material.dart';

PreferredSize appbarConstants({
  double height = 90.0,
  Widget? trailing,
  required Widget title,
  Widget? action,
  Color? color,
  Color? titleColor,
  Color? actionColor,
  Color? trailingColor,
  Function? titleTapped,
  List<Function>? actionsTapped,
  Function? trailingTapped,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height),
    child: Container(
        color: color,
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                trailingTapped == null ? null : trailingTapped();
              },
              child: Container(
                  margin: EdgeInsets.only(left: 16.0),
                  alignment: Alignment.centerLeft,
                  child: trailing),
            ),
            title,
            Container(
                margin: EdgeInsets.only(right: 16.0),
                alignment: Alignment.centerRight,
                child: action),
          ],
        )),
  );
}

SliverAppBar sliverAppbarConstants({
  Widget? trailing,
  required Widget title,
  List<Widget>? action,
  Color? color,
  Color? titleColor,
  Color? actionColor,
  Color? trailingColor,
  Function? titleTapped,
  List<Function>? actionsTapped,
  Function? trailingTapped,
}) {
  return SliverAppBar(
    actions: action,
    collapsedHeight: 64,
    floating: false,
  );
}
