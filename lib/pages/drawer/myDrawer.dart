// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:dashboard/config.dart';
import 'package:dashboard/pages/account/login.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  void logout(context) {
    prefs.remove(G_user_id);
    prefs.remove(G_user_name);
    prefs.remove(G_user_mobile);
    prefs.remove(G_user_image);
    prefs.clear();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => new Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Selam Alhasan",
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text("selamalhasan99@gmail.com",
                style: TextStyle(color: Colors.grey)),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(color: Colors.grey[100]),
          ),
          Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: InkWell(
              onTap: () {
                /*Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new MyProfile()));*/
              },
              child: Column(
                children: [
                  ListTile(
                    title: Text("Hesabım"),
                    leading: Icon(
                      Icons.person,
                      color: Colors.red,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: InkWell(
              onTap: () {
                /*  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new ChangePassword()));*/
              },
              child: Column(
                children: [
                  ListTile(
                    title: Text("Şifre değiştir"),
                    leading: Icon(
                      Icons.lock_open,
                      color: Colors.red,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: InkWell(
              onTap: () {
                /* Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Category()));*/
              },
              child: Column(
                children: [
                  ListTile(
                    title: Text("Yemek listesi"),
                    leading: Icon(
                      Icons.restaurant_menu,
                      color: Colors.red,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: InkWell(
              onTap: () {
                /* Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Category()));*/
              },
              child: Column(
                children: [
                  ListTile(
                    title: Text("Kategoriler"),
                    leading: Icon(
                      Icons.category,
                      color: Colors.red,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: InkWell(
              onTap: () {
                /* Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Tracking()));*/
              },
              child: Column(
                children: [
                  ListTile(
                    title: Text("Aktif Siparişler"),
                    leading: Icon(
                      Icons.delivery_dining_outlined,
                      color: Colors.red,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  ListTile(
                    title: Text("Geçmiş Siparişler"),
                    leading: Icon(
                      Icons.settings_backup_restore_rounded,
                      color: Colors.red,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  ListTile(
                    title: Text("Yardım"),
                    leading: Icon(
                      Icons.phone,
                      color: Colors.red,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: InkWell(
              onTap: () {
                logout(context);
              },
              child: Column(
                children: [
                  ListTile(
                    title: Text("Çıkış Yap"),
                    leading: Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Divider(
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
