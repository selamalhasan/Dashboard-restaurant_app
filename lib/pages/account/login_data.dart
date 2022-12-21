// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, use_build_context_synchronously, prefer_const_constructors

import 'dart:convert';

import 'package:dashboard/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:dashboard/config.dart';
import 'dart:async';

/*Future<bool> loginUsers(
    String use_mobile, String use_pwd, BuildContext context) async {
  var url = Uri.parse(path_api +
      "users/login.php?use_mobile=" +
      use_mobile +
      "&use_pwd=" +
      use_pwd +
      "&token=" +
      token);

  http.Response respone = await http.get(url);
  if (json.decode(respone.body)["code"] == "200") {
    Map arr = json.decode(respone.body)["message"];
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString(G_user_id, arr["use_id"]);
    sh.setString(G_user_name, arr["use_name"]);
    sh.setString(G_user_mobile, arr["use_mobile"]);
    sh.setString(G_user_image, arr["use_image"]);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
    print("success");
    return true;
  } else {
    print("failer");
    return false;
  }
}*/

Future<bool> loginUsers(
    String use_mobile, String use_pwd, BuildContext context) async {
  String url = path_api +
      "users/login.php?use_mobile=" +
      use_mobile +
      "&use_pwd=" +
      use_pwd +
      "&token=" +
      token;

  http.Response respone = await http.get(Uri.parse(url));
  if (json.decode(respone.body)["code"] == "200") {
    Map arr = json.decode(respone.body)["message"];
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString(G_user_id, arr["use_id"]);
    sh.setString(G_user_name, arr["use_name"]);
    sh.setString(G_user_image, arr["use_image"]);
    sh.setString(G_user_mobile, arr["use_mobile"]);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));

    print("success");
    return true;
  } else {
    print("Failer");
    return false;
  }
}
