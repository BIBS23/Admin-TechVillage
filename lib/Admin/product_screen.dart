import 'package:flutter/material.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/banana.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/cakes.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/chicken.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/coconut.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/egg.dart';
import 'package:techvillage_admin/Admin/Data%20Entries%20Screens/milk.dart';
import 'package:techvillage_admin/Admin/fish.dart';
import 'package:techvillage_admin/Admin/pickle_page.dart';
import 'package:techvillage_admin/Admin/prod_list.dart';
import 'package:techvillage_admin/Admin/prod_service_tile.dart';
import 'package:techvillage_admin/Admin/spices.dart';
import 'package:techvillage_admin/Admin/vegetables.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<ProductsPage> {
  List productType = [
    const AddMilk(),
    const AddCoconut(),
    const AddEgg(),
    PicklePage(),
    FishPage(),
    const AddChicken(),
    SpicesPage(),
    VegetablesPage(),
    const AddBanana(),
    const AddCakes(),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
          title: const Text('Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              itemCount: prodList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 120,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return ProdServiceTile(
                    image: prodList[index], title: prodTitle[index], type: productType[index]);
              }),
        ));
  }
}
