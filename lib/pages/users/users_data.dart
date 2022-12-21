// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names, use_build_context_synchronously, unnecessary_new, prefer_collection_literals, deprecated_member_use, prefer_const_constructors

import 'dart:convert';

import 'package:dashboard/pages/function.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:dashboard/pages/users/edit.dart';
import 'package:dashboard/pages/users/users.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:dashboard/config.dart';
import 'dart:async';

import 'package:provider/provider.dart';

List<UserData> usersList = null;

class UserData {
  String use_id;
  String use_name;
  String use_mobile;
  String use_pwd;
  String use_note;

  UserData(
      {this.use_id,
      this.use_name,
      this.use_mobile,
      this.use_pwd,
      this.use_note});
}

class SingleUser extends StatelessWidget {
  int use_index;
  UserData users;

  SingleUser({this.use_index, this.users});
  @override
  Widget build(BuildContext context) {
    var providerUser = Provider.of<LoadingControl>(context);
    return Card(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              usersList.removeAt(use_index);
              deleteData("use_id", users.use_id, "users/delete_user.php");
              providerUser.add_loading();
            },
            child: Container(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ),
          Container(
            child: ListTile(
              title: Text(
                users.use_name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(users.use_mobile.toString()),
              leading: Container(
                width: 50,
              ),
              trailing: Container(
                width: 30,
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new EditUsers(
                                        use_index: use_index,
                                        users: users,
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: FaIcon(
                            FontAwesomeIcons.edit,
                            color: Colors.white,
                            size: 15,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5)),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
