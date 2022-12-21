// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Container circularProgress() {
  return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 10),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.red),
      ));
}

Container linearProgress() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(bottom: 10),
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.red),
    ),
  );
}
