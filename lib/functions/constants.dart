import 'package:flutter/material.dart';

const lightBlue = Color(0xFF45C1DD);
const darkBlue = Color(0xFF0890B2);
const lightRed = Color(0xFFFFB8B8);

const whiteColor = Colors.white;
const blackColor = Colors.black;
const blackButton = Color(0xFF212121);

const scaffoldColor = Color(0xFFF2F2F2);

const lightGrey = Color(0xFFE6E6E6);
const greyColor = Color(0xFFDBDADA);
const darkGreyColor = Color(0xFF6F6F6F);

const dividerColor = Colors.grey;

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

const LinearGradient gradient = LinearGradient(colors: [lightBlue, darkBlue]);

const cSizedBox5 = SizedBox(height: 5);
const cSizedBox10 = SizedBox(height: 10);
const cSizedBox15 = SizedBox(height: 15);
const cSizedBox20 = SizedBox(height: 20);
const cSizedBox30 = SizedBox(height: 30);
const cSizedBox40 = SizedBox(height: 40);

const cSizedBoxWidth5 = SizedBox(width: 5);
const cSizedBoxWidth10 = SizedBox(width: 10);
const cSizedBoxWidth15 = SizedBox(width: 15);
const cSizedBoxWidth30 = SizedBox(width: 30);
const cSizedBoxWidth70 = SizedBox(width: 70);
