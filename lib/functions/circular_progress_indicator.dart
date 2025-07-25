import 'package:flutter/material.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';

Column buildCircularProgressIndicator() => const Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(color: purple, strokeWidth: 3),
    ),
    cSizedBox20,
    Text(
      'Loading..!',
      style: TextStyle(fontWeight: fw500, fontSize: 12, color: purple),
    ),
  ],
);
