// ignore_for_file: prefer_const_constructors, missing_return, prefer_is_empty, prefer_contains, sort_child_properties_last, prefer_final_fields, non_constant_identifier_names, unnecessary_new

/*import 'package:dashboard/config.dart';
import 'package:dashboard/pages/component/progress.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:dashboard/pages/users/users.dart';
import 'package:dashboard/pages/users/users_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<SingleUser> userList = [];

class AddUser extends StatefulWidget {
  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool checkActive = false;
  bool isloading = false;
  var _formKey = GlobalKey<FormState>();
  TextEditingController txtuse_name = new TextEditingController();
  TextEditingController txtuse_pwd = new TextEditingController();
  TextEditingController txtuse_mobile = new TextEditingController();
  TextEditingController txtuse_note = new TextEditingController();

  saveData(context, LoadingControl load) async {
    bool myvalid = _formKey.currentState.validate();
    load.add_loading();
    if (txtuse_name.text.isNotEmpty &&
        txtuse_mobile.text.isNotEmpty &&
        txtuse_pwd.text.isNotEmpty &&
        txtuse_note.text.isNotEmpty &&
        myvalid) {
      isloading = true;
      load.add_loading();
      bool res = await CreateUser(txtuse_name.text, txtuse_mobile.text,
          txtuse_pwd.text, txtuse_note.text, context);
      isloading = res;
      load.add_loading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Yeni Kullanıcı Ekle"),
          centerTitle: true,
        ),
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.only(top: 30),
            child: Column(
              children: <Widget>[
                Consumer<LoadingControl>(builder: (context, load, child) {
                  return Expanded(
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: TextFormField(
                              controller: txtuse_name,
                              decoration: InputDecoration(
                                  hintText: "Kullanıcı adı:",
                                  border: InputBorder.none),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Bu alanın doldurulması zorunludur.";
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: TextFormField(
                              controller: txtuse_mobile,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Telefon",
                                  border: InputBorder.none),
                              validator: (String value) {
                                if (value.isEmpty || value.length < 5) {
                                  return "Bu alanın doldurulması zorunludur.";
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: TextFormField(
                              controller: txtuse_pwd,
                              decoration: InputDecoration(
                                  hintText: "Şifre", border: InputBorder.none),
                              validator: (String value) {
                                if (value.isEmpty || value.length < 5) {
                                  return "Bu alanın doldurulması zorunludur.";
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: TextFormField(
                              controller: txtuse_note,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  hintText: "Note", border: InputBorder.none),
                            ),
                          ),
                          isloading
                              ? circularProgress()
                              : MaterialButton(
                                  onPressed: () {
                                    saveData(context, load);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    child: Text(
                                      "Kaydet",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                    margin: EdgeInsets.only(
                                        bottom: 10.0, top: 30.0),
                                    padding: EdgeInsets.all(2.0),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(25.0)),
                                  )),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ));
  }
}
*/