import 'package:flutter/material.dart';

Widget LineSup(double width, double height, double radius, String text) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: Container(
      padding: EdgeInsets.all(10),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
    ),
  );
}
