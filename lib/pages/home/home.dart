// ignore_for_file: unnecessary_new, prefer_const_constructors, avoid_unnecessary_containers

import 'package:dashboard/config.dart';
import 'package:dashboard/pages/category/category.dart';
import 'package:dashboard/pages/delivery/delivery.dart';
import 'package:dashboard/pages/drawer/myDrawer.dart';
import 'package:dashboard/pages/food/food.dart';
import 'package:dashboard/pages/users/users.dart';
import 'package:dashboard/pages/usersCopy/users.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primeryColor,
        title: Text("DASHBOARD"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Row(
            children: [
              new Expanded(
                  child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Users()));
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(children: [
                    new Icon(
                      Icons.people,
                      size: 80,
                      color: Colors.green,
                    ),
                    new Text(
                      "Kullanıcılar",
                      style: TextStyle(fontSize: 18),
                    )
                  ]),
                ),
              )),
              new Expanded(
                  child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Category()));
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(children: [
                    new Icon(
                      Icons.category,
                      size: 80,
                      color: Colors.orange,
                    ),
                    new Text(
                      "Kategoriler",
                      style: TextStyle(fontSize: 18),
                    )
                  ]),
                ),
              )),
            ],
          ),
          Row(
            children: [
              new Expanded(
                  child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  new Icon(
                    Icons.access_alarm,
                    size: 80,
                    color: Colors.yellow,
                  ),
                  new Text(
                    "Aktif Siparişlar",
                    style: TextStyle(fontSize: 18),
                  )
                ]),
              )),
              new Expanded(
                  child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  new Icon(
                    Icons.timer_off,
                    size: 80,
                    color: Color.fromARGB(255, 171, 39, 176),
                  ),
                  new Text(
                    "Geçmiş Siparişlar",
                    style: TextStyle(fontSize: 18),
                  )
                ]),
              )),
            ],
          ),
          Row(
            children: [
              new Expanded(
                  child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: [
                  new Icon(
                    Icons.notifications,
                    size: 80,
                    color: Colors.red,
                  ),
                  new Text(
                    "Bildirim",
                    style: TextStyle(fontSize: 18),
                  )
                ]),
              )),
              new Expanded(
                  child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Delivery()));
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(children: [
                    new Icon(
                      Icons.delivery_dining_rounded,
                      size: 80,
                      color: Colors.red,
                    ),
                    new Text(
                      "Delivery",
                      style: TextStyle(fontSize: 18),
                    )
                  ]),
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}



/*  


new Expanded(
                  child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Category()));
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(children: [
                    new Icon(
                      Icons.category,
                      size: 80,
                      color: Colors.orange,
                    ),
                    new Text(
                      "Kategoriler",
                      style: TextStyle(fontSize: 18),
                    )
                  ]),
                ),
              )),

 */