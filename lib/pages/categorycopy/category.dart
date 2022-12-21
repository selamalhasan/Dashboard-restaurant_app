// ignore_for_file: sort_child_properties_last, prefer_const_constructors

// ignore_for_file: prefer_const_constructors, unnecessary_new, sort_child_properties_last

/*import 'package:dashboard/config.dart';
import 'package:dashboard/pages/category/add.dart';
import 'package:dashboard/pages/category/edit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category extends StatefulWidget {
  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var myPro = [
    {
      "pro_id": "1",
      "pro_name": "balik",
      "pro_price": "100",
      "pro_image": "images/category/cat1.png",
      "pro_qty": "3"
    },
    {
      "pro_id": "1",
      "pro_name": "balik",
      "pro_price": "100",
      "pro_image": "images/category/cat1.png",
      "pro_qty": "3"
    },
    {
      "pro_id": "1",
      "pro_name": "balik",
      "pro_price": "100",
      "pro_image": "images/category/cat1.png",
      "pro_qty": "3"
    },
    {
      "pro_id": "1",
      "pro_name": "balik",
      "pro_price": "100",
      "pro_image": "images/category/cat1.png",
      "pro_qty": "3"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primeryColor,
        title: Text("Ketegoriler"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[50],
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          margin: EdgeInsets.only(top: 0),
          child: ListView.builder(
            itemCount: myPro.length,
            itemBuilder: ((context, index) {
              return SinglePruduct(
                pro_id: myPro[index]["pro_id"],
                pro_name: myPro[index]["pro_name"],
                pro_image: myPro[index]["pro_image"],
                pro_qty: myPro[index]["pro_qty"],
                pro_price: myPro[index]["pro_price"],
              );
            }),
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
                      MaterialPageRoute(builder: (context) => AddCategory()));
                },
                child: Text(
                  "Yeni ketegori Ekle",
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

class SinglePruduct extends StatelessWidget {
  final String pro_id;
  final String pro_name;
  final String pro_price;
  final String pro_qty;
  final String pro_image;

  SinglePruduct(
      {this.pro_id,
      this.pro_name,
      this.pro_price,
      this.pro_qty,
      this.pro_image});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.delete,
                color: Colors.red,
              )),
          Container(
            child: ListTile(
              title: Text(
                pro_name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(pro_price),
              leading: Container(
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(pro_image), fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              trailing: Container(
                width: 30,
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new EditCategory()));
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