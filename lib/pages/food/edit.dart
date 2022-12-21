// ignore_for_file: prefer_const_constructors, missing_return, prefer_is_empty, prefer_contains, sort_child_properties_last, prefer_final_fields, unnecessary_new, non_constant_identifier_names

import 'package:dashboard/config.dart';
import 'package:dashboard/pages/food/food_data.dart';
import 'package:dashboard/pages/component/progress.dart';
import 'package:dashboard/pages/function.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditFood extends StatefulWidget {
  int foo_index;
  FoodData food;
  EditFood({this.foo_index, this.food});
  @override
  State<EditFood> createState() => _EditFoodState();
}

class _EditFoodState extends State<EditFood> {
  bool isLoading = false;
  var _formKey = GlobalKey<FormState>();
  TextEditingController txtfoo_name = new TextEditingController();
  TextEditingController txtfoo_price = new TextEditingController();
  TextEditingController txtfoo_offer = new TextEditingController();
  TextEditingController txtfoo_info = new TextEditingController();

  updatefood(context, LoadingControl load) async {
    bool myValid = _formKey.currentState.validate();
    load.add_loading();
    if (txtfoo_name.text.isNotEmpty && myValid) {
      isLoading = true;
      load.add_loading();
      Map arr = {
        "foo_id": widget.food.foo_id,
        "foo_name": txtfoo_name.text,
        "foo_price": txtfoo_price.text,
        "foo_offer": txtfoo_offer.text,
        "foo_info": txtfoo_info.text,
      };
      bool res = await updateData(arr,
          "http://127.0.0.1/restaurant-app/api/food/update_food.php?", context);
      foodList[widget.foo_index].foo_name = txtfoo_name.text;

      isLoading = res;
      load.add_loading();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    txtfoo_name.dispose();
    txtfoo_price.dispose();
    txtfoo_offer.dispose();
    txtfoo_info.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtfoo_name.text = widget.food.foo_name;
    txtfoo_price.text = widget.food.foo_price;
    txtfoo_offer.text = widget.food.foo_offer;
    txtfoo_info.text = widget.food.foo_info;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: primeryColor,
          title: Text("Update food"),
          centerTitle: true,
        ),
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.only(top: 30),
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Consumer<LoadingControl>(builder: (context, load, child) {
                  return Expanded(
                      child: Form(
                          key: _formKey,
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
                                  controller: txtfoo_name,
                                  decoration: InputDecoration(
                                      hintText: "Food Name:",
                                      border: InputBorder.none),
                                  validator: (String value) {
                                    if (value.isEmpty || value.length < 1) {
                                      return 'Bu alanın doldurulması zorunludur.';
                                    }
                                  },
                                ),
                              ),
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
                                  controller: txtfoo_price,
                                  decoration: InputDecoration(
                                      hintText: "fiyat",
                                      border: InputBorder.none),
                                  validator: (String value) {
                                    if (value.isEmpty || value.length < 1) {
                                      return 'Bu alanın doldurulması zorunludur.';
                                    }
                                  },
                                ),
                              ),
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
                                  controller: txtfoo_offer,
                                  decoration: InputDecoration(
                                      hintText: "indirim:",
                                      border: InputBorder.none),
                                  validator: (String value) {
                                    if (value.isEmpty || value.length < 1) {
                                      return 'Bu alanın doldurulması zorunludur.';
                                    }
                                  },
                                ),
                              ),
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
                                  controller: txtfoo_info,
                                  decoration: InputDecoration(
                                      hintText: "info:",
                                      border: InputBorder.none),
                                  validator: (String value) {
                                    if (value.isEmpty || value.length < 1) {
                                      return 'Bu alanın doldurulması zorunludur.';
                                    }
                                  },
                                ),
                              ),
                              isLoading
                                  ? circularProgress()
                                  : MaterialButton(
                                      onPressed: () {
                                        updatefood(context, load);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text(
                                          "Kaydet",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        margin: EdgeInsets.only(
                                            left: 100, right: 100),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                      ),
                                    ),
                            ],
                          )));
                }),
              ],
            ),
          ),
        ));
  }
}
