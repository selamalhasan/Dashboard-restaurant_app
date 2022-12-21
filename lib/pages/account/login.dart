// ignore_for_file: prefer_const_constructors, missing_return, prefer_is_empty, prefer_contains, sort_child_properties_last

import 'package:dashboard/pages/component/progress.dart';
import 'package:dashboard/pages/home/home.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/pages/account/login_data.dart';
import 'package:provider/provider.dart';

/*class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isloading = false;
  TextEditingController txtmobile = new TextEditingController();
  TextEditingController txtpwd = new TextEditingController();
  void login(context, load) async {
    if (txtmobile.text.isNotEmpty && txtpwd.text.isNotEmpty) {
      isloading = true;
      load.add_loading();
      bool res = await loginUsers(txtmobile.text, txtpwd.text, context);
      isloading = res;
      load.add_loading();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("load page");
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop()),
        ),
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                    child: Form(
                        child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 25, color: Colors.red),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: TextFormField(
                        controller: txtmobile,
                        decoration: InputDecoration(
                            hintText: "Telefon ", border: InputBorder.none),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Bu alanın doldurulması zorunludur.';
                          }
                        },
                      ),
                    ),
                    /*Container(
                      margin: EdgeInsets.only(bottom: 30),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Telefon", border: InputBorder.none),
                        validator: (String value) {
                          if (value.isEmpty || value.length < 5) {
                            return 'Bu alanın doldurulması zorunludur.';
                          }
                        },
                      ),
                    ),*/
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              obscureText: true,
                              controller: txtpwd,
                              decoration: InputDecoration(
                                  hintText: "Şifre", border: InputBorder.none),
                              validator: (String value) {
                                if (value.isEmpty || value.length < 6) {
                                  return 'Bu alanın doldurulması zorunludur.';
                                }
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgetPassword()));*/
                            },
                            child: Text(
                              "Şifremi Hatırlat",
                              style: TextStyle(color: Colors.red),
                            ),
                          )
                        ],
                      ),
                    ),
                    Consumer<LoadingControl>(builder: (context, load, child) {
                      return isloading
                          ? circularProgress()
                          : MaterialButton(
                              onPressed: () {
                                login(context, load);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Giriş Yap",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                margin: EdgeInsets.only(left: 100, right: 100),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            );
                    })
                  ],
                ))),
              ],
            ),
          ),
        ));
  }
}*/

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isloading = false;
  TextEditingController txtmobile = new TextEditingController();
  TextEditingController txtpwd = new TextEditingController();
  void login(context, load) async {
    if (txtmobile.text.isNotEmpty && txtpwd.text.isNotEmpty) {
      isloading = true;
      load.add_loading();
      bool res = await loginUsers(txtmobile.text, txtpwd.text, context);
      isloading = res;
      load.add_loading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop()),
        ),
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Form(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(bottom: 35.0),
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 25.0, color: Colors.red),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: TextFormField(
                          controller: txtmobile,
                          decoration: InputDecoration(
                              hintText: "Telefon", border: InputBorder.none),
                          validator: (String value) {
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
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                controller: txtpwd,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Şifre",
                                    border: InputBorder.none),
                                validator: (String value) {
                                  if (value.isEmpty || value.length < 6) {
                                    return "Bu alanın doldurulması zorunludur.";
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Consumer<LoadingControl>(builder: (context, load, child) {
                        return isloading
                            ? circularProgress()
                            : MaterialButton(
                                onPressed: () {
                                  login(context, load);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    "Giriş Yap",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                  margin:
                                      EdgeInsets.only(bottom: 10.0, top: 30.0),
                                  padding: EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                ));
                      })
                    ],
                  ),
                )),
              ],
            ),
          ),
        ));
  }
}
