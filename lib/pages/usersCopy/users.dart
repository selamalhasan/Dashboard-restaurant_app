/*// ignore_for_file: prefer_const_constructors, unnecessary_new, sort_child_properties_last, unused_import, prefer_collection_literals, use_key_in_widget_constructors, deprecated_member_use, sized_box_for_whitespace

import 'package:dashboard/config.dart';
import 'package:dashboard/pages/category/add.dart';
import 'package:dashboard/pages/category/edit.dart';
import 'package:dashboard/pages/component/progress.dart';
import 'package:dashboard/pages/users/add.dart';
import 'package:dashboard/pages/users/edit.dart';
import 'package:dashboard/pages/users/users_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../Models/UserModel.dart';
import '../provider/loading.dart';

List<SingleUser> userList = [];

class Users extends StatefulWidget {
  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  ScrollController myScroll;
  GlobalKey<RefreshIndicatorState> refreshKey;
  int i = 0;
  bool loadingList = false;

  void getDataUser(int count, String strSearsh) async {
    loadingList = true;
    setState(() {});
    userList = await getData(count, strSearsh);
    /*
      
    */
    loadingList = false;
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myScroll.dispose();
    userList.clear();
  }

  @override
  void initState() {
    super.initState();
    myScroll = new ScrollController();
    refreshKey = GlobalKey<RefreshIndicatorState>();
    getDataUser(
      0,
      "",
    );

    myScroll.addListener(() {
      if (myScroll.position.pixels == myScroll.position.maxScrollExtent) {
        i += 10;
        getDataUser(i, "");
        print("Scroll");
      }
    });
  }

  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text("Kullanıcılar");
  void _searshPressed(LoadingControl myProv) {
    if (this._searchIcon.icon == Icons.search) {
      this._searchIcon = new Icon(Icons.close);
      this._appBarTitle = new TextField(
        style: TextStyle(color: Colors.white),
        decoration: new InputDecoration(
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (text) {
          userList.clear();
          i = 0;
          getDataUser(0, text);
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
                _searshPressed(myProvider);
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
          userList.clear();
          await getDataUser(0, "");
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
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      final item = userList[index];
                      return Dismissible(
                          key: Key(item.use_id.toString()),
                          direction: DismissDirection.startToEnd,
                          child: SingleUser(
                            use_index: index,
                            use_id: userList[index].use_id,
                            use_name: userList[index].use_name,
                            use_mobile: userList[index].use_mobile,
                            use_pwd: userList[index].use_pwd,
                            use_note: userList[index].use_note,
                          ),
                          onDismissed: (direction) {
                            userList.remove(item);
                            deleteData(item.use_id.toString());
                            myProvider.add_loading();
                          });
                    }),
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
                      MaterialPageRoute(builder: (context) => AddUser()));
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

class SingleUser extends StatelessWidget {
  final int use_index;
  final int use_id;
  final String use_name;
  final String use_pwd;
  final int use_mobile;

  final String use_lastdate;
  final String use_note;

  SingleUser({
    this.use_index,
    this.use_id,
    this.use_name,
    this.use_pwd,
    this.use_mobile,
    this.use_lastdate,
    this.use_note,
  });
  @override
  Widget build(BuildContext context) {
    var providerUser = Provider.of<LoadingControl>(context);
    return Card(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              userList.removeAt(use_index);
              deleteData(use_id.toString());
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
                use_name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(use_mobile.toString()),
              trailing: Container(
                width: 30,
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new EditUser(
                                        use_id: use_id.toString(),
                                        use_name: use_name,
                                        use_mobile: use_mobile.toString(),
                                        use_pwd: use_pwd,
                                        use_note: use_note,
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
*/