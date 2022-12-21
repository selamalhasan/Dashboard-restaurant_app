// ignore_for_file: prefer_const_constructors, missing_return, prefer_is_empty, prefer_contains, sort_child_properties_last, prefer_final_fields, unnecessary_new, non_constant_identifier_names

import 'package:dashboard/config.dart';
import 'package:dashboard/pages/category/category_data.dart';
import 'package:dashboard/pages/component/progress.dart';
import 'package:dashboard/pages/function.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCategory extends StatefulWidget {
  int cat_index;
  CategoryData category;
  EditCategory({this.cat_index, this.category});
  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  bool isLoading = false;
  var _formKey = GlobalKey<FormState>();
  TextEditingController txtcat_name = new TextEditingController();

  updateCategory(context, LoadingControl load) async {
    bool myValid = _formKey.currentState.validate();
    load.add_loading();
    if (txtcat_name.text.isNotEmpty && myValid) {
      isLoading = true;
      load.add_loading();
      Map arr = {
        "cat_id": widget.category.cat_id,
        "cat_name": txtcat_name.text,
      };
      bool res = await updateData(
          arr,
          "http://127.0.0.1/restaurant-app/api/category/update_category.php?",
          context);
      categoryList[widget.cat_index].cat_name = txtcat_name.text;

      isLoading = res;
      load.add_loading();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    txtcat_name.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtcat_name.text = widget.category.cat_name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: primeryColor,
          title: Text("Update Category"),
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
                                  controller: txtcat_name,
                                  decoration: InputDecoration(
                                      hintText: "Categry Name:",
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
                                        updateCategory(context, load);
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
