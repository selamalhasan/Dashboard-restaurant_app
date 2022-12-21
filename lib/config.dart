// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

SharedPreferences prefs;
const Color primeryColor = Color(0xffFF0000);
const String token = "fghffg5464fgh5f64fhfghcfsdfg454656";

final String path_api = "http://localhost/restaurant-app/api/";
final String path_images = "http://192.168.1.42/restaurant-app/images/";

String G_user_id_value = "";

final String G_user_id = "use_id";
final String G_user_name = "use_name";
final String G_user_mobile = "use_mobile";
final String G_user_image = "use_image";
