// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_collection_literals, deprecated_member_use

// ignore_for_file: prefer_const_constructors, unnecessary_new, sort_child_properties_last

import 'package:dashboard/config.dart';
import 'package:dashboard/pages/food/food_data.dart';
import 'package:dashboard/pages/component/progress.dart';
import 'package:dashboard/pages/function.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:dashboard/pages/food/add.dart';
import 'package:dashboard/pages/food/edit.dart';
import 'package:dashboard/pages/users/users_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Food extends StatefulWidget {
  final String cat_id;
  final String cat_name;
  Food({this.cat_id, this.cat_name});
  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  ScrollController myScroll;
  GlobalKey<RefreshIndicatorState> refreshKey;
  int i = 0;
  bool loadingList = false;
  void getDateFood(int count, String strSearch) async {
    loadingList = true;
    setState(() {});
    foodList = await getFood(
        count,
        "http://127.0.0.1/restaurant-app/api/food/read_food.php",
        strSearch,
        "cat_id=${widget.cat_id}&");
    loadingList = false;
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myScroll.dispose();
    foodList.clear();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _appBarTitle = new Text(widget.cat_name);

    foodList = new List<FoodData>();
    myScroll = new ScrollController();
    refreshKey = GlobalKey<RefreshIndicatorState>();
    getDateFood(
      0,
      "",
    );

    myScroll.addListener(() {
      if (myScroll.position.pixels == myScroll.position.maxScrollExtent) {
        i += 30;
        getDateFood(i, "");
        print("scroll");
      }
    });
  }

  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = null;

  void _searchPressed(LoadingControl myProv) {
    if (this._searchIcon.icon == Icons.search) {
      this._searchIcon = new Icon(Icons.close);
      this._appBarTitle = new TextField(
        style: TextStyle(color: Colors.white),
        decoration: new InputDecoration(
            prefixIcon: Icon(Icons.search), hintText: "search"),
        onChanged: (text) {
          foodList.clear();
          i = 0;
          getDateFood(0, text);
          myProv.add_loading();
        },
      );
    } else {
      this._searchIcon = new Icon(Icons.search);
      this._appBarTitle = new Text("Yiyecekler");
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
          foodList.clear();
          await getDateFood(0, "");
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
                  itemCount: foodList.length,
                  itemBuilder: (context, index) {
                    final item = foodList[index];
                    return Dismissible(
                      key: Key(item.foo_id),
                      direction: DismissDirection.startToEnd,
                      child: SingleFood(
                        foo_index: index,
                        food: foodList[index],
                      ),
                      onDismissed: (direction) {
                        foodList.remove(item);

                        deleteData(
                            "foo_id", item.foo_id, "food/delete_food.php");
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddFood(cat_id: widget.cat_id)));
                },
                child: Text(
                  "Add new product",
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
