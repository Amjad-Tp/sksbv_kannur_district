import 'package:flutter/material.dart';

const royalBlue = Color(0xFF405DE6);
const blueNormal = Color(0xFF5B51D8);
const purple = Color(0xFF833AB4);
const darkPink = Color(0xFFC13584);

const whiteColor = Colors.white;
const blackColor = Colors.black;
const lightBlackColor = Color(0xFF1D1D1D);

const scaffoldColor = Color(0xFFF2F2F2);

const greyColor = Color(0xFFC5C5C5);
const lightGreyColor = Color(0xFFECECEC);

const redColor = Colors.red;
const orengeColor = Colors.orange;
const darkOrenge = Colors.deepOrange;
const greenColor = Colors.green;
const transparent = Colors.transparent;

const screenPadding = EdgeInsets.only(top: 20, left: 15, right: 15);

final BorderRadius borderRadius = BorderRadius.circular(10);
final BorderRadius borderRadius8 = BorderRadius.circular(8);

final shadow = [
  BoxShadow(
    blurRadius: 13,
    color: blackColor.withValues(alpha: .1),
  ), //-----BoxShadow of custome card(container)
];

const LinearGradient gradient = LinearGradient(
  colors: [royalBlue, blueNormal, purple, darkPink],
);
//----sized box height
const cSizedBox5 = SizedBox(height: 5);
const cSizedBox10 = SizedBox(height: 10);
const cSizedBox15 = SizedBox(height: 15);
const cSizedBox20 = SizedBox(height: 20);
const cSizedBox30 = SizedBox(height: 30);
const cSizedBox40 = SizedBox(height: 40);
//----sized box width
const cSizedBoxWidth5 = SizedBox(width: 5);
const cSizedBoxWidth10 = SizedBox(width: 10);
const cSizedBoxWidth15 = SizedBox(width: 15);
const cSizedBoxWidth30 = SizedBox(width: 30);
const cSizedBoxWidth70 = SizedBox(width: 70);

//----FontWeight
const FontWeight fw500 = FontWeight.w500;
const FontWeight fw600 = FontWeight.w600;
const FontWeight fwBold = FontWeight.w700;
