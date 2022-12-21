// ignore_for_file: prefer_const_constructors, missing_return, prefer_is_empty, prefer_contains, sort_child_properties_last, prefer_final_fields, unnecessary_new, non_constant_identifier_names

import 'package:dashboard/config.dart';
import 'package:dashboard/pages/delivery/delivery_data.dart';
import 'package:dashboard/pages/component/progress.dart';
import 'package:dashboard/pages/function.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditDelivery extends StatefulWidget {
  int del_index;
  deliveryData delivery;
  EditDelivery({this.del_index, this.delivery});
  @override
  State<EditDelivery> createState() => _EditDeliveryState();
}

class _EditDeliveryState extends State<EditDelivery> {
  bool isLoading = false;
  var _formKey = GlobalKey<FormState>();
  TextEditingController txtdel_name = new TextEditingController();
  TextEditingController txtdel_mobile = new TextEditingController();
  TextEditingController txtdel_pwd = new TextEditingController();

  updatedelivery(context, LoadingControl load) async {
    bool myValid = _formKey.currentState.validate();
    load.add_loading();
    if (txtdel_name.text.isNotEmpty && myValid) {
      isLoading = true;
      load.add_loading();
      Map arr = {
        "del_name": txtdel_name.text,
        "del_mobile": txtdel_mobile.text,
        "del_pwd": txtdel_pwd.text,
      };
      bool res = await updateData(
          arr,
          "http://127.0.0.1/restaurant-app/api/delivery/update_delivery.php?",
          context);
      deliveryList[widget.del_index].del_name = txtdel_name.text;

      isLoading = res;
      load.add_loading();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    txtdel_name.dispose();
    txtdel_mobile.dispose();
    txtdel_pwd.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtdel_name.text = widget.delivery.del_name;
    txtdel_mobile.text = widget.delivery.del_mobile;
    txtdel_pwd.text = widget.delivery.del_pwd;
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: primeryColor,
          title: Text("Update delivery"),
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
                                  controller: txtdel_name,
                                  decoration: InputDecoration(
                                      hintText: "delivery Name:",
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
                                  controller: txtdel_mobile,
                                  decoration: InputDecoration(
                                      hintText: "mobile",
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
                                  controller: txtdel_pwd,
                                  decoration: InputDecoration(
                                      hintText: "password:",
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
                                        updatedelivery(context, load);
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
