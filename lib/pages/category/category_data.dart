// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names, use_build_context_synchronously, unnecessary_new, prefer_collection_literals, deprecated_member_use, prefer_const_constructors, sort_child_properties_last

import 'package:dashboard/pages/category/edit.dart';
import 'package:dashboard/pages/food/food.dart';
import 'package:dashboard/pages/function.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

List<CategoryData> categoryList = null;

class CategoryData {
  String cat_id;
  String cat_name;

  CategoryData({
    this.cat_id,
    this.cat_name,
  });
}

class SingleCategory extends StatelessWidget {
  int cat_index;
  CategoryData category;

  SingleCategory({this.cat_index, this.category});
  @override
  Widget build(BuildContext context) {
    var providerCategory = Provider.of<LoadingControl>(context);
    return Card(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              categoryList.removeAt(cat_index);
              deleteData(
                  "cat_id", category.cat_id, "category/delete_category.php");
              providerCategory.add_loading();
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
                category.cat_name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Column(children: [
                TextButton(
                  child: Text("Add new Product"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => new Food(
                                cat_id: category.cat_id,
                                cat_name: category.cat_name)));
                  },
                )
              ]),
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
                                  builder: (context) => new EditCategory(
                                        cat_index: cat_index,
                                        category: category,
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
                        )),
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
