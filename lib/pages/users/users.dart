// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_collection_literals, deprecated_member_use

// ignore_for_file: prefer_const_constructors, unnecessary_new, sort_child_properties_last

import 'package:dashboard/config.dart';
import 'package:dashboard/pages/component/progress.dart';
import 'package:dashboard/pages/function.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:dashboard/pages/users/add.dart';
import 'package:dashboard/pages/users/edit.dart';
import 'package:dashboard/pages/users/users_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Users extends StatefulWidget {
  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  ScrollController myScroll;
  GlobalKey<RefreshIndicatorState> refreshKey;
  int i = 0;
  bool loadingList = false;
  void getDateUser(int count, String strSearch) async {
    loadingList = true;
    setState(() {});
    usersList = await getData(count,
        "http://127.0.0.1/restaurant-app/api/users/read_user.php", strSearch);
    loadingList = false;
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myScroll.dispose();
    usersList.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usersList = new List<UserData>();
    myScroll = new ScrollController();
    refreshKey = GlobalKey<RefreshIndicatorState>();
    getDateUser(
      0,
      "",
    );

    myScroll.addListener(() {
      if (myScroll.position.pixels == myScroll.position.maxScrollExtent) {
        i += 30;
        getDateUser(i, "");
        print("scroll");
      }
    });
  }

  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text("Kullanıcılar");

  void _searchPressed(LoadingControl myProv) {
    if (this._searchIcon.icon == Icons.search) {
      this._searchIcon = new Icon(Icons.close);
      this._appBarTitle = new TextField(
        style: TextStyle(color: Colors.white),
        decoration: new InputDecoration(
            prefixIcon: Icon(Icons.search), hintText: "search"),
        onChanged: (text) {
          usersList.clear();
          i = 0;
          getDateUser(0, text);
          myProv.add_loading();
        },
      );
    } else {
      this._searchIcon = new Icon(Icons.search);
      this._appBarTitle = new Text("Kullanıcılar");
    }
    myProv.add_loading();
  }

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<LoadingControl>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primeryColor,
        title: _appBarTitle,
        centerTitle: true,
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                _searchPressed(myProvider);
              },
              child: _searchIcon,
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[50],
      body: RefreshIndicator(
        onRefresh: () async {
          i = 0;
          usersList.clear();
          await getDateUser(0, "");
        },
        key: refreshKey,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 0),
                child: ListView.builder(
                  controller: myScroll,
                  itemCount: usersList.length,
                  itemBuilder: (context, index) {
                    final item = usersList[index];
                    return Dismissible(
                      key: Key(item.use_id),
                      direction: DismissDirection.startToEnd,
                      child: SingleUser(
                        use_index: index,
                        users: usersList[index],
                      ),
                      onDismissed: (direction) {
                        usersList.remove(item);

                        deleteData(
                            "use_id", item.use_id, "users/delete_user.php");
                        myProvider.add_loading();
                      },
                    );
                  },
                ),
              ),
              Positioned(
                child: loadingList ? circularProgress() : Text(""),
                bottom: 0,
                left: MediaQuery.of(context).size.width / 2,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddUsers()));
                },
                child: Text(
                  "Yeni Kullanıcı Ekle",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(40)),
            ),
          ],
        ),
      ),
    );
  }
}
