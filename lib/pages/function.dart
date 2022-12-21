// ignore_for_file: unnecessary_new, prefer_interpolation_to_compose_strings, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:dashboard/pages/category/category_data.dart';
import 'package:dashboard/pages/delivery/delivery_data.dart';
import 'package:dashboard/pages/food/food_data.dart';
import 'package:dashboard/pages/users/users.dart';
import 'package:dashboard/pages/users/users_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:dashboard/config.dart';
import 'dart:async';

Future<bool> createData(Map arrInsert, String urlPage, BuildContext context,
    Widget Function() movePage) async {
  var url = Uri.parse(path_api + "${urlPage}?&token=" + token);

  http.Response respone = await http.post(url, body: arrInsert);

  if (json.decode(respone.body)["code"] == "200") {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => movePage()));

    print("success");
    return true;
  } else {
    print("Failer");
    return false;
  }
}

Future<bool> uploadFileWithData(Map arrInsert, String urlPage,
    BuildContext context, Widget Function() movePage) async {
  var url = Uri.parse(path_api + "${urlPage}?&token=" + token);

  http.Response respone = await http.post(url, body: arrInsert);

  if (json.decode(respone.body)["code"] == "200") {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => movePage()));

    print("success");
    return true;
  } else {
    print("Failer");
    return false;
  }
}

Future<bool> updateData(
    Map arrUpdate, String urlPage, BuildContext context) async {
  var url = Uri.parse("${urlPage}&token=" + token);

  http.Response respone = await http.post(url, body: arrUpdate);

  if (json.decode(respone.body)["code"] == "200") {
    Navigator.pop(context);

    print("success");
    return true;
  } else {
    print("Failer");
    return false;
  }
}

Future<List<UserData>> getData(
    int count, String urlPage, String strSearch) async {
  var response = await Dio().get(
      "${urlPage}?txtsearch=${strSearch}&start=${count}&end=30&token=" + token);
  List<UserData> userList = [];
  for (var i in response.data["message"]) {
    userList.add(new UserData(
      use_id: i["use_id"].toString(),
      use_name: i["use_name"],
      use_mobile: i["use_mobile"].toString(),
      use_pwd: i["use_pwd"],
      use_note: i["use_note"],
    ));
  }
  return userList;
}

Future<List<CategoryData>> getCategory(
    int count, String urlPage, String strSearch) async {
  var response = await Dio().get(
      "${urlPage}?txtsearch=${strSearch}&start=${count}&end=30&token=" + token);
  List<CategoryData> categoryList = [];
  for (var i in response.data["message"]) {
    categoryList.add(new CategoryData(
      cat_id: i["cat_id"].toString(),
      cat_name: i["cat_name"],
    ));
  }
  return categoryList;
}

Future<List<deliveryData>> getDelivery(
    int count, String urlPage, String strSearch) async {
  var response = await Dio().get(
      "${urlPage}?txtsearch=${strSearch}&start=${count}&end=30&token=" + token);
  List<deliveryData> deliveryList = [];
  for (var i in response.data["message"]) {
    deliveryList.add(new deliveryData(
      del_id: i["del_id"].toString(),
      del_name: i["del_name"],
      del_mobile: i["del_mobile"],
      del_pwd: i["del_pwd"],
    ));
  }
  return deliveryList;
}

Future<List<FoodData>> getFood(
    int count, String urlPage, String strSearch, String str) async {
  var response = await Dio().get(
      "${urlPage}?${str}txtsearch=${strSearch}&start=${count}&end=30&token=" +
          token);
  List<FoodData> foodList = [];
  for (var i in response.data["message"]) {
    foodList.add(new FoodData(
      foo_id: i["foo_id"].toString(),
      cat_id: i["cat_id"].toString(),
      foo_name: i["foo_name"],
      foo_price: i["foo_price"].toString(),
      foo_offer: i["foo_offer"].toString(),
      foo_info: i["foo_info"],
    ));
  }
  return foodList;
}

Future<bool> deleteData(String col_id, String val_id, String urlPage) async {
  String url = path_api + "${urlPage}?${col_id}=${val_id}&token=" + token;
  print(url);
  http.Response respone = await http.post(Uri.parse(url));

  if (json.decode(respone.body)["code"] == "200") {
    return true;
  } else {
    return false;
  }
}
