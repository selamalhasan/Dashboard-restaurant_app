// ignore_for_file: prefer_const_constructors, missing_return, prefer_is_empty, prefer_contains, sort_child_properties_last

import 'package:dashboard/config.dart';
import 'package:flutter/material.dart';

class AddCategory extends StatefulWidget {
  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: primeryColor,
          title: Text("Ketegori Ekle"),
          centerTitle: true,
        ),
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.only(top: 30),
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                    child: Form(
                        child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Category Name:",
                            border: InputBorder.none),
                        validator: (String value) {
                          if (value.isEmpty || value.length < 1) {
                            return 'Bu alanın doldurulması zorunludur.';
                          }
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Kaydet",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        margin: EdgeInsets.only(left: 100, right: 100),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  ],
                ))),
              ],
            ),
          ),
        ));
  }
}
