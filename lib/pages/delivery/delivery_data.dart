// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names, use_build_context_synchronously, unnecessary_new, prefer_collection_literals, deprecated_member_use, prefer_const_constructors, sort_child_properties_last

import 'package:dashboard/pages/delivery/edit.dart';
import 'package:dashboard/pages/function.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

List<deliveryData> deliveryList = null;

class deliveryData {
  String del_id;
  String del_name;
  String del_mobile;
  String del_pwd;

  deliveryData({
    this.del_id,
    this.del_name,
    this.del_mobile,
    this.del_pwd,
  });
}

class SingleDelivery extends StatelessWidget {
  int del_index;
  deliveryData delivery;

  SingleDelivery({this.del_index, this.delivery});
  @override
  Widget build(BuildContext context) {
    var providerdelivery = Provider.of<LoadingControl>(context);
    return Card(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              deliveryList.removeAt(del_index);
              deleteData(
                  "del_id", delivery.del_id, "delivery/delete_delivery.php");
              providerdelivery.add_loading();
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
                delivery.del_name,
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
                                  builder: (context) => new EditDelivery(
                                        del_index: del_index,
                                        delivery: delivery,
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
