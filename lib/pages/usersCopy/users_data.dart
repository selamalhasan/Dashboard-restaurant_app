// ignore_for_file: unnecessary_brace_in_string_interps, prefer_interpolation_to_compose_strings

/*import 'dart:convert';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:dashboard/pages/users/users.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:dashboard/config.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import '../../Models/UserModel.dart';

Future<bool> CreateUser(String use_name, String use_mobile, String use_pwd,
    String use_note, BuildContext context) async {
  var url = Uri.parse(path_api + "users/insert_user.php?token=" + token);
  Map data = {
    "use_name": use_name,
    "use_mobile": use_mobile,
    "use_pwd": use_pwd,
    "use_note": use_note
  };
  http.Response respone = await http.post(url, body: data);
  print(json.decode(respone.body)["code"].toString());
  if (json.decode(respone.body)["code"] == "200") {
    print("success");

    Navigator.push(context, MaterialPageRoute(builder: (context) => Users()));

    return true;
  } else {
    print("Failer");
    return false;
  }
}

Future<bool> updateUser(String use_id, String use_name, String use_mobile,
    String use_pwd, String use_note, BuildContext context) async {
  var url = Uri.parse(path_api + "users/update_user.php?token=" + token);
  Map data = {
    "use_id": use_id,
    "use_name": use_name,
    "use_mobile": use_mobile,
    "use_pwd": use_pwd,
    "use_note": use_note
  };
  print("==========================");
  http.Response respone = await http.post(url, body: data);
  print(json.decode(respone.body)["code"].toString());
  if (json.decode(respone.body)["code"] == "200") {
    print("success");

    Navigator.push(context, MaterialPageRoute(builder: (context) => Users()));

    return true;
  } else {
    print("Failer");
    return false;
  }
}

Future<List<SingleUser>> getData(int count, String strSearsh) async {
  var response = await Dio().get(
      "http://127.0.0.1/restaurant-app/api/users/read_user.php?txtsearsh=${strSearsh}&start=${count}&end=10&token=" +
          token);

  List<SingleUser> users = [];
  for (var user in response.data["message"]) {
    users.add(SingleUser(
      use_id: user["use_id"],
      use_name: user["use_name"],
      use_mobile: user["use_mobile"],
      use_lastdate: user["use_lastdate"],
    ));
  }
  return users;
}

Future<bool> deleteData(String use_id) async {
  String url =
      "http://127.0.0.1/restaurant-app/api/users/delete_user.php?use_id=${use_id}&token=" +
          token;
  print(url);
  http.Response respone = await http.post(Uri.parse(url));

  if (json.decode(respone.body)["code"] == "200") {
    return true;
  } else {
    return false;
  }
}
*/