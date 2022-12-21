// ignore_for_file: prefer_const_constructors, missing_return, prefer_is_empty, prefer_contains, sort_child_properties_last, prefer_final_fields, unnecessary_new, non_constant_identifier_names, deprecated_member_use, prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:dashboard/config.dart';
import 'package:dashboard/pages/delivery/delivery.dart';
import 'package:dashboard/pages/component/progress.dart';
import 'package:dashboard/pages/function.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';

class AddDelivery extends StatefulWidget {
  @override
  State<AddDelivery> createState() => _AddDeliveryState();
}

class _AddDeliveryState extends State<AddDelivery> {
  bool isLoading = false;
  var _formKey = GlobalKey<FormState>();
  TextEditingController txtdel_name = new TextEditingController();
  TextEditingController txtdel_mobile = new TextEditingController();
  TextEditingController txtdel_pwd = new TextEditingController();

  saveDate(context, LoadingControl load) async {
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
      bool res = await await createData(
          arr, "delivery/insert_delivery.php", context, () => Delivery());
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

  File _image;
  final picker = ImagePicker();
  Future getImageGallery() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print("No image selected");
      }
    });
  }

  Future getImageCamera() async {
    var image = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print("No image selected");
      }
    });
  }

  void showSheetGallery(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: [
                new ListTile(
                  leading: new Icon(Icons.image),
                  title: new Text("Gallery"),
                  onTap: () {
                    getImageGallery();
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.camera),
                  title: new Text("Camera"),
                  onTap: () {
                    getImageCamera();
                  },
                )
              ],
            ),
          );
        });
  }

  Future<bool> UploadFile(File imageFile) async {
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));

    var length = await imageFile.length();
    var uri = Uri.parse(path_api + "delivery/insert_delivery.php");
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile("file", stream, length,
        filename: basename(imageFile.path));
    request.fields["del_name"] = txtdel_name.text;
    request.files.add(multipartFile);
    var response = await request.send();

    if (response.statusCode == 200) {
      print("basarili");
      return true;
    } else {
      print("basarsiz");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: primeryColor,
          title: Text("Add Delivery"),
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
                                      hintText: "mobile:",
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
                              Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.image,
                                      size: 50,
                                      color: Colors.orange,
                                    ),
                                    onPressed: () {
                                      showSheetGallery(context);
                                    },
                                  )),
                              /*Container(
                                padding: EdgeInsets.all(15),
                                child: _image == null
                                    ? new Text("")
                                    : new Image.file(
                                        _image,
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                              ),*/
                              isLoading
                                  ? circularProgress()
                                  : MaterialButton(
                                      onPressed: () {
                                        saveDate(context, load);
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
