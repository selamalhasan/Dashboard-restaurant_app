// ignore_for_file: prefer_const_constructors, missing_return, prefer_is_empty, prefer_contains, sort_child_properties_last, prefer_final_fields, unnecessary_new, non_constant_identifier_names, deprecated_member_use, prefer_interpolation_to_compose_strings

import 'dart:io';

import 'package:dashboard/config.dart';
import 'package:dashboard/pages/food/food.dart';
import 'package:dashboard/pages/component/progress.dart';
import 'package:dashboard/pages/function.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:path/path.dart';

class AddFood extends StatefulWidget {
  final String cat_id;
  AddFood({this.cat_id});
  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  bool isLoading = false;
  var _formKey = GlobalKey<FormState>();
  TextEditingController txtfoo_name = new TextEditingController();
  TextEditingController txtfoo_price = new TextEditingController();
  TextEditingController txtfoo_offer = new TextEditingController();
  TextEditingController txtfoo_info = new TextEditingController();

  saveDate(context, LoadingControl load) async {
    bool myValid = _formKey.currentState.validate();
    load.add_loading();
    if (txtfoo_name.text.isNotEmpty && myValid) {
      isLoading = true;
      load.add_loading();
      Map arr = {
        "cat_id": widget.cat_id,
        "foo_name": txtfoo_name.text,
        "foo_price": txtfoo_price.text,
        "foo_offer": txtfoo_offer.text,
        "foo_info": txtfoo_info.text,
      };
      bool res = await await createData(
          arr, "food/insert_food.php", context, () => Food());
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
    var uri = Uri.parse(path_api + "food/insert_food.php");
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile("file", stream, length,
        filename: basename(imageFile.path));
    request.fields["foo_name"] = txtfoo_name.text;
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
          title: Text("Yiyecek Ekle"),
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
                                      hintText: "food Name:",
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
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: "fiyat:",
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
                                  keyboardType: TextInputType.number,
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
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
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

/* 

name: dashboard
description: A new Flutter project.

# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
  sdk: '>=2.9.0 <3.0.0'

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2
  splashscreen: ^1.3.5
  font_awesome_flutter: ^10.3.0
  http: ^0.12.1
  shared_preferences: ^0.5.12+4
  provider: ^6.0.4
  image_picker: ^0.6.7+21
  cached_network_image: ^2.5.1
  #dio: ^4.0.6
  dio: ^3.0.10
dev_dependencies:
  flutter_test:
    sdk: flutter

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^2.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg
  #==============categorey
    - images/food/cat1.png
    - images/food/cat2.png
    - images/food/cat3.png
    - images/food/cat4.png
    - images/food/cat5.png
    - images/food/cat6.png
    - images/food/cat7.png
    - images/food/cat8.png
    - images/food/cat9.png
    - images/food/cat10.png

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/assets-and-images/#resolution-aware

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/assets-and-images/#from-packages

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/custom-fonts/#from-packages



 */
