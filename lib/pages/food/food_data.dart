// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names, use_build_context_synchronously, unnecessary_new, prefer_collection_literals, deprecated_member_use, prefer_const_constructors, sort_child_properties_last

import 'package:dashboard/pages/food/edit.dart';
import 'package:dashboard/pages/function.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

List<FoodData> foodList = null;

class FoodData {
  String foo_id;
  String cat_id;
  String foo_name;
  String foo_price;
  String foo_offer;
  String foo_info;

  FoodData(
      {this.foo_id,
      this.cat_id,
      this.foo_name,
      this.foo_price,
      this.foo_offer,
      this.foo_info});
}

class SingleFood extends StatelessWidget {
  int foo_index;
  FoodData food;

  SingleFood({this.foo_index, this.food});
  @override
  Widget build(BuildContext context) {
    var providerfood = Provider.of<LoadingControl>(context);
    return Card(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              foodList.removeAt(foo_index);
              deleteData("foo_id", food.foo_id, "food/delete_food.php");
              providerfood.add_loading();
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
                food.foo_name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              leading: Container(
                width: 50,
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
                                  builder: (context) => new EditFood(
                                        foo_index: foo_index,
                                        food: food,
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
